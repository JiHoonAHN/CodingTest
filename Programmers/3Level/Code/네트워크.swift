import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visit : [Bool] = Array(repeating: false, count: n)
    var answer : Int = 0
    func bfs (_ vertax: Int){
        visit[vertax] = true
        for i in 0..<n{  if computers[vertax][i] == 1 && visit[i] == false { bfs(i) }}
    }
    for i in 0..<n { if !visit[i] { answer += 1
            bfs(i)
        }
    }
    return answer
}