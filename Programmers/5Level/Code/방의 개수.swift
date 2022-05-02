import Foundation
func solution(_ arrows:[Int]) -> Int {
    var visited : Set<Point> = [Point(x: 0 ,y : 0)]
    var history : [Point : [Int]] = .init()
    
    var answer  = 0
    var lastPoint = Point(x: 0, y: 0)
    
    arrows.forEach{
        let origin = lastPoint
        lastPoint = origin.move(to: $0)
        
        let point : (Point,LocationType) = ($0 >= 4) ? (origin.move(to: $0), LocationType(rawValue: $0 - 4)!) : (origin, LocationType(rawValue: $0)!)
        if history[point.0]?.contains(point.1.rawValue) ?? false {return}
        if point.1 == .upright || point.1 == .downright{
            let crossCheck = (point.1 == .upright) ? history[point.0.move(to: 0)]?.contains(3) ?? false : history[point.0.move(to: 4)]?.contains(1) ?? false
            if crossCheck { answer += 1 }
        }
        if visited.contains(origin.move(to: $0)) {answer += 1}
        visited.insert(origin.move(to: $0))
        if let current = history[point.0]
        {history.updateValue(current + [point.1.rawValue], forKey: point.0)}
        else
        {history[point.0] = [point.1.rawValue]}
    }
    return answer
}
struct Point: Hashable{
    let x : Int
    let y : Int
    
    static let move = [(0,-1), (1,-1), (1,0), (1,1), (0,1), (-1,1), (-1,0), (-1,-1)]

    func move(to location: Int) -> Point {
        return Point(x: x + Point.move[location].0, y: y + Point.move[location].1)
    }
}
enum LocationType : Int, CaseIterable{
    case up = 0 , upright = 1 , right = 2 , downright = 3
}