import Foundation

func solution(_ n:Int) -> Int {
    var chess : [Int] = .init(repeating: -1, count : n)
    var answer : Int = .init()
    func checkTheChess(_ x : Int, _ y : Int) -> Bool{
        for i in 0..<x{if chess[i] == y || abs(x - i) - abs(y - chess[i]) == 0 {return false}}
        return true
    }
    func dfs(count : Int){
        if count == n{
            answer += 1
            return
        }
        for i in 0..<n{
            if checkTheChess(count, i){
                chess[count] = i
                dfs(count : count + 1)
                chess[count] = -1
            }
        }
    }
    dfs(count : 0)
    return answer
}