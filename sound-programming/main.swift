import Foundation

print("Hello, World!")


var pcm1 = MONO_PCM(fs: 8000, bits: 16, length: 8000, s: [])
let A: Double = 0.25
let f0: Double = 250.0

for n in 0..<pcm1.length {
    let data = A * sin(2 * Double.pi * f0 * Double(n) / 8000)
    
    print(data)
    //  print(data)
     pcm1.s.append(data)
}
mono_wave_write(pcm: pcm1, fileName: "/Users/junpeiono/Desktop/xyz.wav")

print("Done!!!")
