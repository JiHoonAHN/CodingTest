import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{ return Int64(w*h - (w+h-gcd(w,h)))}
func gcd(_ w: Int, _ h: Int) -> Int{ return 0 == w % h ? min(w,h) : gcd(h,w%h)}