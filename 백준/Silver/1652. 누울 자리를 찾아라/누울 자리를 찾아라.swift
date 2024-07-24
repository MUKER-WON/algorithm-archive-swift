let N = Int(readLine()!)!
var yArr = Array(repeating: "", count: N), result = [0,0]
for _ in 0..<N {
    let str = readLine()!
    result[0] += str.split {$0=="X"}.filter {$0.count>=2}.count
    str.enumerated().forEach {yArr[$0.offset]+=String($0.element)}
}
for i in yArr { result[1] += i.split {$0=="X"}.filter {$0.count>=2}.count }
print("\(result[0]) \(result[1])")