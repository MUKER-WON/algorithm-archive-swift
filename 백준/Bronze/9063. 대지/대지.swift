var y = (10000,-10000)
var x = (10000,-10000)
var count = 0
for _ in 0..<Int(readLine()!)! {
    count += 1
    let yx = readLine()!.split(separator: " ").map { Int($0)! }
    y.0 = min(yx[0],y.0)
    y.1 = max(yx[0],y.1)
    x.0 = min(yx[1],x.0)
    x.1 = max(yx[1],x.1)
}
count > 1 ? print((y.1-y.0) * (x.1-x.0)) : print(0)