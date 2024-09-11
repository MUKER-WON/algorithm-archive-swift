let I = readLine()!.split { $0 == " " }.map { Int($0)! }

func task(_ a: Int, _ b: Int, _ m: Int) -> Int {
    if b == 0 { return 1 }
    let n = task(a, b/2, m)
    return b % 2 == 0 ? (n*n) % m : (n*n % m) * a % m
}

print(task(I[0],I[1],I[2]))