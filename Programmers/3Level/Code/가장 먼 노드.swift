import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var answer :[Set<Int>] = [[1]]
    var connection = [[Int]]()
    var visited = [Bool]()
    connection = Array(repeating: [Int](), count: n+1)
    visited = Array(repeating: false , count: n+1)
    edge.forEach{ connection[$0[0]].append($0[1]);connection[$0[1]].append($0[0])}
    var currentNodes:Set = [1]
    var current = 1
    while !currentNodes.isEmpty {
        var nodes = Set<Int>()
        currentNodes.forEach{ visited[$0] = true }
        for node in currentNodes {
            findConnection(n: node, answer: &answer, connection: &connection, visited: &visited, currentLine: current).forEach{nodes.insert($0)}
        }
        current += 1
        currentNodes = nodes
    }
    
    answer.removeLast()
    
    return answer.last?.count ?? 0
}

func findConnection(n:Int,answer : inout [Set<Int>],  connection : inout [[Int]], visited : inout[Bool],currentLine:Int) -> Set<Int> {
    if answer.count == currentLine {
        answer.append([])
    }
    for number in connection[n] {
        if !visited[number] {
            answer[currentLine].insert(number)
        }
    }
    return answer[currentLine]
}