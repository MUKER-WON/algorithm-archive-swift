let NX = readLine()!.split { $0 == " " }.map { Int($0)! }
let N = NX[0], X = NX[1]
var total = [1]+Array(repeating: 0, count: 50)
var patty = [1]+Array(repeating: 0, count: 50)

for i in 1...N {
    total[i] = total[i-1]*2+3
    patty[i] = patty[i-1]*2+1
}

func sol(n: Int, x: Int) -> Int {
    if n == 0 { return x }
    if x == 1 { return 0 }
    if x == total[n] { return patty[n] }
    
    if x == total[n-1] + 2 {
        return patty[n-1] + 1
    } else if x < total[n-1] + 2 {
        return sol(n: n-1, x: x-1)
    } else {
        return patty[n-1] + 1 + sol(n: n-1, x: x - (total[n-1] + 2))
    }
}

print(sol(n: N, x: X))