// func solution(_ arr:[Int]) -> Double {
//     var a : Double = 0
//     for i in 0..<arr.count{
//         a = a + Double(arr[i])
//     }
//     return a/Double(arr.count)
// }

// 더 줄이기

func solution(_ arr:[Int]) -> Double {
    return Double(arr.reduce(0, {$0 + $1}))/Double(arr.count)
}