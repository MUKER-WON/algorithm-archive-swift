let price = readLine()!.split(separator: " ").map { Int($0)! }
var arr = Array(repeating: 0, count: 101)
for _ in 0..<3 {
    let i = readLine()!.split(separator: " ").map { Int($0)! }
    (i[0]..<i[1]).forEach { arr[$0] += 1 }
}
print(arr.map {
    switch $0 {
    case 1: return price[0]
    case 2: return price[1]*2
    case 3: return price[2]*3
    default: return 0
    }
}.reduce(0,+))