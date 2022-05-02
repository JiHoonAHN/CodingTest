import Foundation
func solution(_ s: String) -> Int {
    let arr = Array(s)
    var phase = arr.count
    outer: while phase > 1 {
    for i in (0...arr.count - phase) {
        var size = 0
        for j in (i..<i+phase/2) {
            if arr[j] != arr[i + phase - 1 - (j - i)] {
                break
            }
                size += 1
            }
            if size == phase/2 {
                break outer
            }
        }
    phase -= 1
    }
    return phase
}