import Foundation
func  solution(_ sizes: [[Int]]) -> Int{
    return sizes.map{$0.sorted()}.map{$0[0]}.max()! * sizes.map{$0.sorted()}.map{$0[1]}.max()!
}
// 해결 방법 세로 가장 큰 값에 가로 가장 큰 값만 찾으면 됨
