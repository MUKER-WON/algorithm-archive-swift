var (left,right) = ([Int](),[Int]())
for _ in 0..<3 {
  let n = readLine()!.split(separator: " ").map { Int($0)! }
  left.append(n[0])
  right.append(n[1])
}
Dictionary(grouping: left, by: { $0 }).mapValues { $0.count }.filter { $0.value == 1 }.forEach { print($0.key,terminator: " ") }
Dictionary(grouping: right, by: { $0 }).mapValues { $0.count }.filter { $0.value == 1 }.forEach { print($0.key,terminator: " ") }