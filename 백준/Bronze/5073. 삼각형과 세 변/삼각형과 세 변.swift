while true {
    let input = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    if input == [0,0,0] { break }
    if input[2] < input[1]+input[0] {
        let count = Set(input).count
        count == 1 ? print("Equilateral") : count == 2 ? print("Isosceles") : print("Scalene")
    } else {
        print("Invalid")
    }
}