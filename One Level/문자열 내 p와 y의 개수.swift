import Foundation

// func solution(_ s:String) -> Bool
// {
//     let lower = s.lowercased()
//     var pcount = 0
//     var ycount = 0
    
//     for i in 0..<s.count{
//         let index = lower.index(s.startIndex,offsetBy : i)
//         switch lower[index]{
//             case "p":
//                 pcount += 1
//             case "y":
//                 ycount += 1
//             default:
//                 print("다른거")
            
//         }
//     }
//           return pcount == ycount ? true : false

// }

// 더 짧게 짜기 

func solution(_ s:String) -> Bool
{
    return s.lowercased().components(separatedBy: "p").count == s.lowercased().components(separatedBy: "y").count
}