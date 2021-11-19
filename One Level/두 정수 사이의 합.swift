// func solution(_ a:Int, _ b:Int) -> Int64 {
//     var num : Int = 0
//     var num2 : Int = 0
//     if (a<b){
//         num = b
//         num2 = a
//     }
//     else{
//         num = a
//         num2 = b
//     }
//     var c = num - num2
//     var count = 0
//     for i in 1...c{
//         count += num2 + i
//     }
//     num2 = count + num2
//     return Int64(num2)
// }

//비효율 적이라서 바꿈

func solution(_ a:Int, _ b:Int) -> Int64 {
    return Int64(Array(a > b ? b...a : a...b).reduce(0,+))
}