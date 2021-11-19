import Foundation

//func solution(_ numbers: [Int]) -> Int{
//    var a = 45
//    for i in 0..<numbers.count{
//        a = a - numbers[i]
//    }
//    return a
//}

// 너무 길어서 한번 다시 풀어봤습니다

func solution(_ numbers:[Int]) -> Int {
    return 45 - numbers.reduce(0) {$0 + $1}
}
