let I = readLine()!.split { $0 == " " }.map { Int($0)! }
let (A,B,C) = (I[0],I[1],I[2])

func task(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return 1 }
    let n = task(a, b/2)
    return b % 2 == 0 ? (n*n) % C : (n*n % C) * a % C
}
print(task(A,B))