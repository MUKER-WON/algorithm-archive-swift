let N = Int(readLine()!)!
let A = Set(readLine()!.split(separator: " ").map { Int(String($0))! })
let M = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var result = ""

input.forEach {
    result += A.contains($0) ? "1\n" : "0\n"
}

print(result)