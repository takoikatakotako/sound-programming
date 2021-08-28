import Foundation

// ファイルをDFT
func ex2_4(filePath: String) {
    let pcm0 = monoWaveRead(filePath: filePath)

    let N: Int = 64
    var xReal: [Double] = [Double](repeating: 0, count: N)
    var xImag: [Double] = [Double](repeating: 0, count: N)
    var XReal: [Double] = [Double](repeating: 0, count: N)
    var XImag: [Double] = [Double](repeating: 0, count: N)

    var wReal: Double
    var wImag: Double
    
    
    
    for n in 0..<N {
        xReal[n] = pcm0.s[n]    // x(n)の実数部
        xImag[n] = 0.0  // x(n)の虚数部
    }
    
    // DFT
    for k in 0..<N {
        for n in 0..<N {
            wReal = cos(2.0 * Double.pi * Double(k) * Double(n) / Double(N) )
            wImag = -sin(2.0 * Double.pi * Double(k) * Double(n) / Double(N) )
            XReal[k] += wReal * xReal[n] - wImag * xImag[n]
            XImag[k] += wReal * xImag[n] + wImag * xReal[n]
        }
    }
    
    for k in 0..<N {
       print("\(k) \(XReal[k]) + \(XImag[k])")
    }
}
