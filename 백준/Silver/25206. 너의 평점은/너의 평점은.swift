import Foundation

var credit = 0.0
var major = 0.0
for _ in 0..<20 {
    let i = readLine()!.split(separator: " ")
    switch i[2] {
    case "A+": major += 4.5 * Double(i[1])!
    case "A0": major += 4.0 * Double(i[1])!
    case "B+": major += 3.5 * Double(i[1])!
    case "B0": major += 3.0 * Double(i[1])!
    case "C+": major += 2.5 * Double(i[1])!
    case "C0": major += 2.0 * Double(i[1])!
    case "D+": major += 1.5 * Double(i[1])!
    case "D0": major += 1.0 * Double(i[1])!
    case "F": major += 0.0 * Double(i[1])!
    default: continue
    }
    credit += Double(i[1])!
}
print(String(format: "%.6f", (major / credit)))