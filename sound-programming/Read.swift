import Foundation


func mono_wave_read(filePath: String) -> MonoPulseCodeModulation {
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
    var riffChunkSize: Int = 0
    var riffFormTypeBuffer: [CChar] = [CChar](repeating: 0, count: 4)
    var fmtChunkIdBuffer: [CChar]  = [CChar](repeating: 0, count: 4)
    var fmtChunkSize: Int = 0
    var fmtWaveFormatType: Int = 0
    var fmtChannel: Int = 0
    var fmtSamplesPerSec: Int = 0
    var fmtBytesPerSec: Int = 0
    var fmtBlockSize: Int = 0
    var fmtBitsPerSample: Int = 0
    var dataChunkIdBuffer: [CChar]  = [CChar](repeating: 0, count: 4)
    var dataChunkSize: Int = 0

    
    fread(&riffChunkIdBuffer, 1, 4, fp)
    fread(&riffChunkSize, 4, 1, fp)
    fread(&riffFormTypeBuffer, 1, 4, fp)
    fread(&fmtChunkIdBuffer, 1, 4, fp)
    fread(&fmtChunkSize, 1, 4, fp)
    fread(&fmtWaveFormatType, 2, 1, fp)
    fread(&fmtChannel, 2, 1, fp)
    fread(&fmtSamplesPerSec, 4, 1, fp)
    fread(&fmtBytesPerSec, 4, 1, fp)
    fread(&fmtBlockSize, 2, 1, fp)
    fread(&fmtBitsPerSample, 2, 1, fp);
    fread(&dataChunkIdBuffer, 1, 4, fp);
    fread(&dataChunkSize, 4, 1, fp);
    
//    let riffChunkId = NSString(bytes: riffChunkIdBuffer, length: 4, encoding: String.Encoding.ascii.rawValue)! as String
//    let riffFormType = NSString(bytes: riffFormTypeBuffer, length: 4, encoding: String.Encoding.ascii.rawValue)! as String
//    
    var pcm = MonoPulseCodeModulation(fs: fmtSamplesPerSec, bits: fmtBitsPerSample, length: dataChunkSize / 2, s: [])

    for n in 0..<pcm.length {
        var data: CShort = 0
        fread(&data, 2, 1, fp)
        pcm.s.append(Double(data) / 32768.0)
    }
    
    fclose(fp)
    
    return pcm
}
