let I = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N, M) = (I[0], I[1])
var dic = [String: Int]()

let monsters = (1...I[0]).map { i -> String in
    let str = readLine()!
    dic[str, default: 0] = i
    return str
}
(0..<I[1]).forEach { _ in
    let n = readLine()!
    if let num = Int(n) {
        print(monsters[num-1])
    } else {
        print(dic[n]!)
    }
}