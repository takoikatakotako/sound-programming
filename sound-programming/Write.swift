import Foundation

func mono_wave_write(pcm: MONO_PCM, fileName: String) {
    let fp = fopen(fileName, "wb")
    
    let riffChunkId: String = "RIFF"
    let riffChunkIdBuffer: [CChar]  = riffChunkId.cString(using: .utf8)!
    var riffChunkSize: Int = 36 + pcm.length * 2
    let riffFormType: String = "WAVE"
    let riffFormTypeBuffer: [CChar]  = riffFormType.cString(using: .utf8)!
    let fmtChunkId: String = "fmt "
    let fmtChunkIdBuffer: [CChar]  = fmtChunkId.cString(using: .utf8)!
    var fmtChunkSize: Int = 16
    var fmtWaveFormatType: Int = 1
    var fmtChannel: Int = 1
    var fmtSamplesPerSec: Int = pcm.fs
    var fmtBytesPerSec = pcm.fs * pcm.bits / 8
    var fmtBlockSize: Int = pcm.bits
    var fmtBitsPerSample = pcm.bits
    let dataChunkId: String = "data"
    let dataChunkIdBuffer: [CChar]  = dataChunkId.cString(using: .utf8)!
    var dataChunkSize: Int = pcm.length * 2
    
    fwrite(riffChunkIdBuffer, 1, 4, fp)
    fwrite(&riffChunkSize, 4, 1, fp)
    fwrite(riffFormTypeBuffer, 1, 4, fp)
    fwrite(fmtChunkIdBuffer, 1, 4, fp)
    fwrite(&fmtChunkSize, 4, 1, fp)
    fwrite(&fmtWaveFormatType, 2, 1, fp)
    fwrite(&fmtChannel, 2, 1, fp)
    fwrite(&fmtSamplesPerSec, 4, 1, fp)
    fwrite(&fmtBytesPerSec, 4, 1, fp);
    fwrite(&fmtBlockSize, 2, 1, fp);
    fwrite(&fmtBitsPerSample, 2, 1, fp);
    fwrite(dataChunkIdBuffer, 1, 4, fp);
    fwrite(&dataChunkSize, 4, 1, fp)


    for n in 0..<pcm.length {
        var s: Double = (pcm.s[n] + 1.0) / 2.0 * 65536.0;

                
        if (s > 65535.0) {
          s = 65535.0;
        } else if (s < 0.0) {
          s = 0.0;
        }

        // data = (short)(s + 0.5) - 32768;
        var data: CShort = CShort((s + 0.5) - 32768)
        fwrite(&data, 2, 1, fp)
    }

    fclose(fp)
}





//void mono_wave_write(MONO_PCM *pcm, char *file_name)
//{
//  FILE *fp;
//  int n;
//  char riff_chunk_ID[4];
//  long riff_chunk_size;
//  char riff_form_type[4];
//  char fmt_chunk_ID[4];
//  long fmt_chunk_size;
//  short fmt_wave_format_type;
//  short fmt_channel;
//  long fmt_samples_per_sec;
//  long fmt_bytes_per_sec;
//  short fmt_block_size;
//  short fmt_bits_per_sample;
//  char data_chunk_ID[4];
//  long data_chunk_size;
//  short data;
//  double s;
//
//  riff_chunk_ID[0] = 'R';
//  riff_chunk_ID[1] = 'I';
//  riff_chunk_ID[2] = 'F';
//  riff_chunk_ID[3] = 'F';
//  riff_chunk_size = 36 + pcm->length * 2;
//  riff_form_type[0] = 'W';
//  riff_form_type[1] = 'A';
//  riff_form_type[2] = 'V';
//  riff_form_type[3] = 'E';
//
//  fmt_chunk_ID[0] = 'f';
//  fmt_chunk_ID[1] = 'm';
//  fmt_chunk_ID[2] = 't';
//  fmt_chunk_ID[3] = ' ';
//  fmt_chunk_size = 16;
//  fmt_wave_format_type = 1;
//  fmt_channel = 1;
//  fmt_samples_per_sec = pcm->fs; /* �W�{�����g�� */
//  fmt_bytes_per_sec = pcm->fs * pcm->bits / 8;
//  fmt_block_size = pcm->bits / 8;
//  fmt_bits_per_sample = pcm->bits; /* �ʎq�����x */
//
//  data_chunk_ID[0] = 'd';
//  data_chunk_ID[1] = 'a';
//  data_chunk_ID[2] = 't';
//  data_chunk_ID[3] = 'a';
//  data_chunk_size = pcm->length * 2;
//
//  fp = fopen(file_name, "wb");
//
//  fwrite(riff_chunk_ID, 1, 4, fp);
//  fwrite(&riff_chunk_size, 4, 1, fp);
//  fwrite(riff_form_type, 1, 4, fp);
//  fwrite(fmt_chunk_ID, 1, 4, fp);
//  fwrite(&fmt_chunk_size, 4, 1, fp);
//  fwrite(&fmt_wave_format_type, 2, 1, fp);
//  fwrite(&fmt_channel, 2, 1, fp);
//  fwrite(&fmt_samples_per_sec, 4, 1, fp);
//  fwrite(&fmt_bytes_per_sec, 4, 1, fp);
//  fwrite(&fmt_block_size, 2, 1, fp);
//  fwrite(&fmt_bits_per_sample, 2, 1, fp);
//  fwrite(data_chunk_ID, 1, 4, fp);
//  fwrite(&data_chunk_size, 4, 1, fp);
//
//  for (n = 0; n < pcm->length; n++)
//  {
//    s = (pcm->s[n] + 1.0) / 2.0 * 65536.0;
//
//    if (s > 65535.0)
//    {
//      s = 65535.0; /* �N���b�s���O */
//    }
//    else if (s < 0.0)
//    {
//      s = 0.0; /* �N���b�s���O */
//    }
//
//    data = (short)(s + 0.5) - 32768; /* �l�̌ܓ��ƃI�t�Z�b�g�̒��� */
//    fwrite(&data, 2, 1, fp); /* ���f�[�^�̏����o�� */
//  }
//
//  fclose(fp);
//}
