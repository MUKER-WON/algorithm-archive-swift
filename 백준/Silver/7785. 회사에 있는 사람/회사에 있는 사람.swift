var set = Set<String>()
for i in 0..<Int(readLine()!)! {
    var input = readLine()!.split(separator: " ").map { String($0) }
    if input[1] == "enter" {
        set.insert(input[0])
    } else {
        set.remove(input[0])
    }
}
set.sorted(by: >).forEach { print($0) }