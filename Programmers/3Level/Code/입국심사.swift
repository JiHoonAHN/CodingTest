import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var (min,max) = (Int64(1),Int64(times.max()!) * Int64(n))
    return binary(times: times, n: n, min: &min, max: &max)
}

func binary(times:[Int],n:Int,min:inout Int64,max: inout Int64) -> Int64{
    var minTime : Int64 = 0
    while min <= max{
        let mid = (min + max)/2
        let peopleCount = times.map{mid/Int64($0)}.reduce(0,+)
        if peopleCount >= n {
                   minTime = mid
                   max = mid - 1
               } else {
                   min = mid + 1
               }
           }
           return minTime
}