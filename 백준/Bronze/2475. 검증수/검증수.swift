let input = readLine()!.split(separator: " ").map { Int($0)! }
print(input.map { $0 * $0 }.reduce(0,+) % 10)