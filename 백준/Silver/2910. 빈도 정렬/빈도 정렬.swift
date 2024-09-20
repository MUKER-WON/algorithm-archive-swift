_ = readLine()
var dic = [Int: (Int,Int)]()
var ans = ""

readLine()!.split { $0 == " " }.enumerated().forEach {
    let n = Int(String($0.element))!
    dic[n, default: ($0.offset, 0)].1 += 1
}

print(dic.sorted {
    $0.value.1 != $1.value.1 ? $0.value.1 > $1.value.1 : $0.value.0 < $1.value.0
}.map {
    String(repeating: "\($0.key) ", count: $0.value.1)
}.joined())
