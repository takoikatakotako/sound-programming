import Foundation

//
func ex1_1(inputFilePath: String, outputFilePath: String) {
    let pcm0 = mono_wave_read(filePath: inputFilePath)
    let pcm1 = pcm0
    mono_wave_write(pcm: pcm1, filePath: outputFilePath)
}
