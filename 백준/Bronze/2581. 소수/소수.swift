import Foundation
let (M,N) = (Int(readLine()!)!,Int(readLine()!)!)
let a = (M...N).filter {
    if $0<4 {return $0==1 ? false : true}
    for i in 2...Int(sqrt(Double($0))) { if ($0%i==0) {return false} }
    return true
}
if a.isEmpty {print(-1)}
else { print(a.reduce(0,+)); print(a[0])}