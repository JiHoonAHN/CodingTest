func solution(_ a:Int, _ b:Int) -> String {
  let day = ["THU", "FRI", "SAT", "SUN", "MON", "TUE", "WED"]
  var sumOfDays = 0	
  for i in 1..<a {
    var daysOfMonth = 0	
    switch i {
    case 1, 3, 5, 7, 8, 10, 12 :
      daysOfMonth = 31
    case 2:
      daysOfMonth = 29
    default:
      daysOfMonth = 30
    }
    sumOfDays += daysOfMonth
  }
  
  sumOfDays += b

  return day[(sumOfDays % 7)]
}