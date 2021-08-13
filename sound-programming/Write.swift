import Foundation

func monoWaveWrite(pcm: MonoPulseCodeModulation, filePath: String) {
    let fp = fopen(filePath, "wb")
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
        var data: CShort = CShort((s + 0.5) - 32768)
        fwrite(&data, 2, 1, fp)
    }
    fclose(fp)
}
