func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    let dic = Dictionary(uniqueKeysWithValues: zip(name,yearning))
    return photo.map { arr in arr.map { dic[$0] ?? 0 }.reduce(0,+) }
}