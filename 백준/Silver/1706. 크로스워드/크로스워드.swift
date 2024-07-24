let RC = readLine()!.split(separator: " ").map { Int($0)! }, R = RC[0], C = RC[1]
var arr = [[String]]()
var cArr = Array(repeating: "", count: C)
var result = Set<String>()
for _ in 0..<R {
    let str = readLine()!
    let temp = str.split { $0=="#" }.filter { $0.count > 1 }
    temp.forEach { result.insert(String($0)) }
    str.enumerated().forEach { cArr[$0.offset] += String($0.element) }
}
for i in cArr {
    let temp = i.split { $0=="#" }.filter { $0.count > 1 }
    temp.forEach { result.insert(String($0)) }
}
print(result.sorted()[0])