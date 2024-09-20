let I = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N,C) = (I[0],I[1])
var dic = [Int: (Int,Int)]()
var cnt = 1
var ans = ""

readLine()!.split { $0 == " " }.forEach {
    let n = Int(String($0))!
    if dic[n] == nil { dic[n] = (cnt,0) }
    dic[n] = (dic[n]!.0, dic[n]!.1+1)
    cnt += 1
}

dic.sorted {
    $0.value.1 != $1.value.1 ? $0.value.1 > $1.value.1 : $0.value.0 < $1.value.0
}.forEach {
    ans += Array(repeating: String($0.key), count: $0.value.1).joined(separator: " ") + " "
}

print(ans)