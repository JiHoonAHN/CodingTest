import Foundation

//func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
//    var answer = 0
//    for i in 0..<signs.count{
//        answer += signs[i] == true ? absolutes[i] : -absolutes[i]
//    }
//    return answer
//}

// 다시 풀기

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    zip(absolutes, signs).map{$1 ? $0 : -$0}.reduce(0, +)
}
