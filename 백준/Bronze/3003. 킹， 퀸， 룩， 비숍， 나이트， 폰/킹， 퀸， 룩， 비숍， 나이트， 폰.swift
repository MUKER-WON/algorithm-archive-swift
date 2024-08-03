let temp = [1, 1, 2, 2, 2, 8]

var result: [Int] = []

var input = readLine()!.split(separator: " ").map { Int($0)! }

for (index, value) in input.enumerated() {
    result.append(temp[index] - value)
}

for i in result {
    print(i, terminator: " ")
}
