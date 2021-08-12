import Foundation

// 
func ex2_1(filePath: String) {
    var pcm1 = MonoPulseCodeModulation(fs: 8000, bits: 16, length: 8000, s: [])
    let A: Double = 0.25
    let f0: Double = 250.0

    for n in 0..<pcm1.length {
        let data = A * sin(2 * Double.pi * f0 * Double(n) / Double(pcm1.fs))
         pcm1.s.append(data)
    }
    mono_wave_write(pcm: pcm1, filePath: filePath)
}
