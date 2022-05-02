import Foundation

func solution(_ n:Int) -> [[Int]] {
    var hanoiArray: [[Int]] = []
    
    func hanoi(_ n: Int, _ from: Int, _ by: Int, _ to: Int) -> [[Int]] {
        if n == 1 {
           hanoiArray.append([from,to])
       } else {
          hanoi(n-1, from,to,by)
          hanoi(1, from,by,to)
          hanoi(n-1, by,from,to)  
      }
        return hanoiArray
    }   
    return hanoi(n,1,2,3)
}