import Foundation

func solution(_ n:Int) -> Int {
    if n <= 2 {return n}
    var point : [Int] = Array(repeating: 0, count : n+1)
    point[0] = 1; point[1] = 1
    for i in 2...n{
        for j in 1...i/2{
            point[i] += point[j-1] * point[i-j]
        }
        point[i] = i%2 == 0 ? point[i] * 2 : point[i] * 2 + point[i/2] * point[i/2]
    }
    return point.last!
}