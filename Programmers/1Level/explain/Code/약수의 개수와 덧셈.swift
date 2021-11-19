import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
  var answer = 0
    
    for n in left...right {
      
       let count = (1...n).map{$0}.filter{n%$0 == 0}.count
      
        answer += count%2 == 0 ? n : -n
    }
    
    return answer
}