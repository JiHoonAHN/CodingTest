// func solution(_ x:Int, _ n:Int) -> [Int64] {
//     var answer : [Int64] = []
//     for i in 1...n{
//         answer.append(Int64(x*i))
//     }
//     return answer
// }

//길어서 다시 만들기

func solution(_ x:Int, _ n:Int) -> [Int64] {
    return Array(1...n).map { Int64($0 * x) }
}
