import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var playsByGenre: [String:Int] = .init()
    var idsByGenre: [String:[Int]] = .init()
     
    for i in 0..<genres.count {
        let genre = genres[i]
        let play = plays[i]

        if let pCount = playsByGenre[genre] {
            playsByGenre[genre] = pCount + play
        } else {
            playsByGenre[genre] = play
        }
        if idsByGenre[genre] != nil {
            idsByGenre[genre]!.append(i)
        } else {
            idsByGenre[genre] = [i]
        }
    }
    let bestGenre: [String] = Array(playsByGenre.keys).sorted{
        return playsByGenre[$0]! > playsByGenre[$1]!
    }
    var answer: [Int] = .init()
    for genre in bestGenre {
        let IDs = idsByGenre[genre]!.sorted{
            return plays[$0] > plays[$1]
        }
        answer.append(IDs[0])
        if IDs.count > 1 {
            answer.append(IDs[1])
        }
    }
    return answer
}