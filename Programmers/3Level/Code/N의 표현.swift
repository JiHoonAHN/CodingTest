import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
    //N 과 Number가 같을때 1 출력
    if N == number {
        return 1
    }
    //답이 
    var answer: Int = -1
    func dfs(_ count: Int, _ now: Int) {
        if count > 8 { return }
        if now == number {
            if count < answer || answer == -1 {
                answer = count
            }
            return
        }
        var NN = 0
        for i in 0..<8 {
            if answer != -1 && answer < count + 1 + i {
                break
            }
            NN = NN*10 + N
            dfs(count + 1 + i, now + NN)
            dfs(count + 1 + i, now - NN)
            dfs(count + 1 + i, now * NN)
            dfs(count + 1 + i, now / NN)
        }
    }
    dfs(0, 0)
    return answer
}