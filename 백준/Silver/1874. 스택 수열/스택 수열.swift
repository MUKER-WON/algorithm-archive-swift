import Foundation

let input = Int(readLine()!)!
var arr = (0..<input).map { _ in Int(readLine()!)! }
var stack = [Int]()
var result = [String]()
var count = 0
for i in 1...(input+1) { // [1,2  - [2,1]
    guard !stack.isEmpty else {
        stack.append(i)
        result.append("+")
        continue
    }
    
    while count < arr.count && arr[count] == stack.last {
        stack.removeLast()
        count += 1
        result.append("-")
    }
    
    stack.append(i)
    result.append("+")
    
}
if stack.count == 1 {
    result.removeLast()
    for i in result {
        print(i)
    }
} else { print("NO") }