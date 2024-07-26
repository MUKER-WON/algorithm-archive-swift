import Foundation

let size = readLine()!.components(separatedBy: " ").map { Int($0)! }
var N = Array(repeating: Array(repeating: 0, count: size[1]), count: size[0])
var M = Array(repeating: Array(repeating: 0, count: size[1]), count: size[0])

for i in 0..<size[0] { N[i] = readLine()!.components(separatedBy: " ").map { Int($0)! } }
for i in 0..<size[0] { M[i] = readLine()!.components(separatedBy: " ").map { Int($0)! } }

for i in 0..<size[0] {
    for j in 0..<size[1] {
        print(N[i][j] + M[i][j], terminator: " ")
    }
    print("")
}