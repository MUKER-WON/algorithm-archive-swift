let I = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N,M) = (I[0],I[1])

func task(_ arr: [Int]) {
    if arr.count == M {
        print(arr.map { String($0) }.joined(separator: " "))
        return
    }
    for i in arr.last!...N { task(arr+[i]) }
}

for i in 1...N { task([i]) }