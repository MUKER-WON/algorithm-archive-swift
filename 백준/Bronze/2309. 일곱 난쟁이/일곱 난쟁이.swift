var dwarf = [Int]()
for _ in 0..<9 { dwarf.append(Int(readLine()!)!) }
outerLoop: for i in 0..<9 {
    for j in i+1..<9 {
        if dwarf.reduce(0,+) - (dwarf[i] + dwarf[j]) == 100 {
            dwarf.remove(at: i)
            dwarf.remove(at: j-1)
            break outerLoop
        }
    }
}
for i in dwarf.sorted() { print(i) }