func solution(_ n: Int, _ k: Int, _ cmd: [String]) -> String {
    var exist = [Bool](repeating: true, count: n)
    var up = [Int](-1...n-1)
    var down = [Int](1...n)
    var delete = [Int]()
    var now = k
    
    for cmd in cmd {
        let op = cmd.components(separatedBy: " ")
        if op[0] == "U" {
            let cnt = Int(op[1])!
            for _ in 0..<cnt {
                now = up[now]
            }
        } else if op[0] == "D" {
            let cnt = Int(op[1])!
            for _ in 0..<cnt {
                now = down[now]
            }
        } else if op[0] == "C" {
            exist[now] = false
            delete.append(now)
            if up[now] != -1 {
                down[up[now]] = down[now]
            }
            
            if down[now] != n {
                up[down[now]] = up[now]
            }
            
            now = down[now] == n ? up[now] : down[now]
        } else if op[0] == "Z" {
            let idx = delete.popLast()!
            exist[idx] = true
            if up[idx] != -1 {
                down[up[idx]] = idx
            }
            if down[idx] != n {
                up[down[idx]] = idx
            }
        }
        
    }
    
    return exist.map { $0 ? "O" : "X" }.joined()
}