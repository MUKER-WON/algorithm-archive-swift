import Foundation
let N = Int(readLine()!)!
var score = [0,0], time = [0,0], current = 0
for _ in 0..<N {
    let input = readLine()!.split {$0 == " "}
    let now = input[1].split {$0 == ":"}.map {Int($0)!}
    let goal = now[0]*60 + now[1]
    if score[0] > score[1] { time[0] += goal-current }
    else if score[1] > score[0] { time[1] += goal-current }
    score[Int(input[0])!-1] += 1
    current = goal
}
if score[0] > score[1] { time[0] += 48*60-current }
else if score[1] > score[0] { time[1] += 48*60-current }
print("\(String(format: "%02d", time[0]/60)):\(String(format: "%02d", time[0]%60))")
print("\(String(format: "%02d", time[1]/60)):\(String(format: "%02d", time[1]%60))")