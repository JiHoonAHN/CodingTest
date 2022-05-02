import Foundation

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    var graph = [[Int]](repeating: [Int](), count: n + 1)
    var weakerThanMe = [Int](repeating: 0, count: n + 1)
    var strongerThanMe = [Int](repeating: 0, count: n + 1)
    var visited = [Bool](repeating: false, count: n + 1)
    var weakerCounter = 0
    
    func dfs(_ cur: Int) {
        visited[cur] = true
        
        for weaker in graph[cur] {
            if visited[weaker] == false {
                strongerThanMe[weaker] += 1
                weakerCounter += 1
                dfs(weaker)
            }
        }
    }

    for result in results {
        let winner = result[0]
        let loser = result[1]
        graph[winner].append(loser)
    }
    
    for idx in 1...n {
        visited = [Bool](repeating: false, count: n + 1)
        weakerCounter = 0
        dfs(idx)
        weakerThanMe[idx] = weakerCounter
        
    }
    
    var answer = 0

    for idx in 1...n {
        if strongerThanMe[idx] + weakerThanMe[idx] == n - 1 {
            answer += 1
        }
    }
    return answer
}