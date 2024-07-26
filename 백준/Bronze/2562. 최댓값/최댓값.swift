var arr: [Int] = []

for _ in 1...9 {
    arr.append(Int(readLine()!)!)
}
let max = arr.max()!
print(max)
print(arr.firstIndex(of: max)! + 1)