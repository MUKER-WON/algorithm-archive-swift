let input = readLine()!.split(separator: " ").map { Int($0)! }
var nameSearch = [String: Int]()
var numSearch = [Int: String]()

for i in 1...input[0] {
    let name = readLine()!
    nameSearch[name] = i
    numSearch[i] = name
}
for _ in 0..<input[1] {
    let temp = readLine()!
    if let inputInt = Int(temp) {
        print(numSearch[inputInt]!)
    } else {
        print(nameSearch[temp]!)
    }
}