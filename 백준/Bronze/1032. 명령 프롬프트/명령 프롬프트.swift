let N = Int(readLine()!)!
var arr = [[String]]()
var result = ""
for _ in 0..<N { arr.append(readLine()!.map{String($0)}) }
for i in 0..<arr[0].count {
    var word = Set<String>()
    for j in 0..<N { word.insert(arr[j][i]) }
    if word.count == 1 { result += word.first! } else { result += "?" }
}
print(result)

