var area: Set<[Int]> = []

for _ in 0..<4 {
    let arr = readLine()!.split { $0 == " " }.map { Int($0)! }
    for i in arr[0]..<arr[2] {
        for j in arr[1]..<arr[3] {
            area.insert([i,j])
        }
    }
}
print(area.count)