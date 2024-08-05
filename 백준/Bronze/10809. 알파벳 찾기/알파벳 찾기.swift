let input = readLine()!.map { $0.asciiValue! }

for i in Character("a").asciiValue!...Character("z").asciiValue! {
    if input.contains(i) {
        print("\(input.firstIndex(of: i)!)", terminator: " ")
    } else {
        print("-1", terminator: " ")
    }
}