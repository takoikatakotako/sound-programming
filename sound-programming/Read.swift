import Foundation


func mono_wave_read(filePath: String) -> MonoPulseCodeModulation {
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
    //
    
    
    let fp = fopen(filePath, "rb")
    var riffChunkIdBuffer: [CChar] = [CChar](repeating: 0, count: 4)

    
    
    
    fread(&riffChunkIdBuffer, 1, 4, fp)

    //  fread(&riff_chunk_size, 4, 1, fp);
    //  fread(riff_form_type, 1, 4, fp);
    //  fread(fmt_chunk_ID, 1, 4, fp);
    //  fread(&fmt_chunk_size, 4, 1, fp);
    //  fread(&fmt_wave_format_type, 2, 1, fp);
    //  fread(&fmt_channel, 2, 1, fp);
    //  fread(&fmt_samples_per_sec, 4, 1, fp);
    //  fread(&fmt_bytes_per_sec, 4, 1, fp);
    //  fread(&fmt_block_size, 2, 1, fp);
    //  fread(&fmt_bits_per_sample, 2, 1, fp);
    //  fread(data_chunk_ID, 1, 4, fp);
    //  fread(&data_chunk_size, 4, 1, fp);
    //
    //  pcm->fs = fmt_samples_per_sec; /* �W�{�����g�� */
    //  pcm->bits = fmt_bits_per_sample; /* �ʎq�����x */
    //  pcm->length = data_chunk_size / 2; /* ���f�[�^�̒��� */
    //  pcm->s = calloc(pcm->length, sizeof(double)); /* �������̊m�� */
    //
    //  for (n = 0; n < pcm->length; n++)
    //  {
    //    fread(&data, 2, 1, fp); /* ���f�[�^�̓ǂݎ�� */
    //    pcm->s[n] = (double)data / 32768.0; /* ���f�[�^��-1�ȏ�1�����͈̔͂ɐ��K������ */
    //  }
    //
    //  fclose(fp);
    
    
    return MonoPulseCodeModulation(fs: 0, bits: 0, length: 0, s: [])
}

//void mono_wave_read(MONO_PCM *pcm, char *file_name)
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
//
//  fp = fopen(file_name, "rb");
//
//  fread(riff_chunk_ID, 1, 4, fp);
//  fread(&riff_chunk_size, 4, 1, fp);
//  fread(riff_form_type, 1, 4, fp);
//  fread(fmt_chunk_ID, 1, 4, fp);
//  fread(&fmt_chunk_size, 4, 1, fp);
//  fread(&fmt_wave_format_type, 2, 1, fp);
//  fread(&fmt_channel, 2, 1, fp);
//  fread(&fmt_samples_per_sec, 4, 1, fp);
//  fread(&fmt_bytes_per_sec, 4, 1, fp);
//  fread(&fmt_block_size, 2, 1, fp);
//  fread(&fmt_bits_per_sample, 2, 1, fp);
//  fread(data_chunk_ID, 1, 4, fp);
//  fread(&data_chunk_size, 4, 1, fp);
//
//  pcm->fs = fmt_samples_per_sec; /* �W�{�����g�� */
//  pcm->bits = fmt_bits_per_sample; /* �ʎq�����x */
//  pcm->length = data_chunk_size / 2; /* ���f�[�^�̒��� */
//  pcm->s = calloc(pcm->length, sizeof(double)); /* �������̊m�� */
//
//  for (n = 0; n < pcm->length; n++)
//  {
//    fread(&data, 2, 1, fp); /* ���f�[�^�̓ǂݎ�� */
//    pcm->s[n] = (double)data / 32768.0; /* ���f�[�^��-1�ȏ�1�����͈̔͂ɐ��K������ */
//  }
//
//  fclose(fp);
//}
//
//
