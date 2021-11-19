import Foundation

func solution(_ n: Int, _ lost: [Int], _ reserve: [Int]) -> Int {
    var students = Array(repeating: 0, count: n)
    
    for i in lost { students[i-1] -= 1 }
    for j in reserve { students[j-1] += 1 }
    
    for (index, k) in students.enumerated() {
        if k == -1 {
            if (index > 0 && students[index-1] == 1) {
                students[index-1] -= 1
                students[index] += 1
            }
            else if (index < students.count - 1) && students[index + 1] == 1 {
                students[index + 1] -= 1
                students[index] += 1
            }
        }
    }
    return students.filter{$0 >= 0}.count
}
