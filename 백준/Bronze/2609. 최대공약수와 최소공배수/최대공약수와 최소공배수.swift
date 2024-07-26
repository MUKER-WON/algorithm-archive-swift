import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
func gcd(a: Int, b: Int) -> Int {
    if a % b == 0 { return b }
    return gcd(a: b, b: a % b)
}
let num = gcd(a: input[0], b: input[1])
print(num)
print(input[0] * input[1] / num)