let computerCount = Int(readLine()!)!
let networkCount = Int(readLine()!)!
var network = Array(repeating: [Int](), count: computerCount+1)
var virus = [1]
var result = [Int]()
for _ in 0..<networkCount {
    let i = readLine()!.split(separator: " ").map { Int($0)! }
    network[i[0]].append(i[1])
    network[i[1]].append(i[0])
}
while !virus.isEmpty {
    let pop = virus.popLast()!
    for i in network[pop] {
        if !result.contains(i) && !virus.contains(i) { virus.append(i) }
    }
    result.append(pop)
}
print(result.count-1)