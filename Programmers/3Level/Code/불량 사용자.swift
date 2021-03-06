func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    var result : [[Int]] = Array(repeating: [], count: banned_id.count)
    for (index , banID) in banned_id.enumerated(){
        for (i,userID) in user_id.enumerated(){
            // 유저아이디와 불량사용자 길이가 다르면 해당하지않는 아이디임
            if userID.count != banID.count{continue}
            // * 의 위치 저장
            let startIndex = banID.enumerated().filter{ $1 == "*"}.map{$0.offset}
            var tempBanID = banID.map{ String($0)}
            let tempUserID = userID.map{ String($0) }
            startIndex.forEach{
                tempBanID[$0] = tempUserID[$0]
            }
            // 유저아이디와 불량아이디포맷과 같다
            // result배열에 벤아이디에 해당하는 인덱스의 위치에 저장
            if tempUserID.joined() == tempBanID.joined(){
                result[index].append(i)
            }
        }
    }
    var set = Set<[Int]>()
    func combinate(i: Int, select: [Int]){
        if select.count == banned_id.count{
            set.update(with: select.sorted())
            return
        }
        var select = select
        //2차원 배열 순서대로 접근
        let arr = result[i]
        for n in arr {
            if select.contains(n) { continue }
            select.append(n)
            combinate(i: i+1, select: select)
            select.removeLast()
        }
    }
    combinate(i: 0, select: [])
    return set.count
}