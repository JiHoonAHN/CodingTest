import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    var visited = [Bool](repeating: false, count: tickets.count)
    var result : [String] = .init()
    dfs(start: "ICN", tickets:  tickets.sorted { $0[1] < $1[1] }, result: &result, visited: &visited)
    return result
}
func dfs(start : String,tickets : [[String]], result: inout [String],  visited :inout [Bool] ) {
    if result.count  == tickets.count{
        result.append(start)
        return
    }
    for i in 0..<tickets.count{
        if tickets[i][0] == start && !visited[i] {
            visited[i] = true
            result.append(start)
            dfs(start: tickets[i][1], tickets: tickets, result: &result, visited: &visited)
            
            if result.count == tickets.count + 1 {
                return
            }
            result.removeLast()
            visited[i] = false
        }
    }
}