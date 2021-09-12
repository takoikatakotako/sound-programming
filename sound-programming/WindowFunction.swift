import Foundation

func hanningWindow(N: Int) -> [Double] {
    var w: [Double] = []
    if (N % 2 == 0) {
        // Nが偶数のとき
        for n in 0..<N {
            let value = 0.5 - 0.5 * cos(2.0 * Double.pi * Double(n) / Double(N))
            w.append(value)
        }
    } else {
        // Nが奇数のとき
        for n in 0..<N  {
            let value = 0.5 - 0.5 * cos(2.0 * Double.pi * (Double(n) + 0.5) / Double(N))
            w.append(value)
        }
    }
    return w
}
