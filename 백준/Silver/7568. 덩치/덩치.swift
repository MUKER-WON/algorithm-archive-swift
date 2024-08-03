import Foundation

let input = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: 0, count: 2), count: input)
var rank = Array(repeating: 1, count: input)

for i in 0..<input { arr[i] = readLine()!.split(separator: " ").map { Int($0)! } }

for i in 0..<input {
    for j in 0..<input {
        guard i != j else { continue }
        if arr[i][0] < arr[j][0] && arr[i][1] < arr[j][1] {
            rank[i] += 1
        }
    }
}
for i in rank { print(i, terminator: " ")}