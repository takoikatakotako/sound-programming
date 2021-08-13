import Foundation

//
func ex1_1(inputFilePath: String, outputFilePath: String) {
    let pcm0 = monoWaveRead(filePath: inputFilePath)
    let pcm1 = pcm0
    monoWaveWrite(pcm: pcm1, filePath: outputFilePath)
}
