var gifts = [Int]()
for _ in 0..<Int(readLine()!)! {
    let a = readLine()!
    if a == "0" {
        print(gifts.isEmpty ? -1 : gifts.popLast()!)
    } else {
        gifts += a.split { $0 == " " }.map { Int($0)! }[1...]
        gifts.sort(by: <)
    }
}