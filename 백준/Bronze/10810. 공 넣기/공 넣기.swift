let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0], M = NM[1] // N
var basket = Array(repeating: 0, count: N)
for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    for i in input[0]...input[1] {
        basket[i-1] = input[2]
    }
}
basket.forEach { print($0,terminator: " ")}