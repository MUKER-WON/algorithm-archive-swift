let count = Int(readLine()!)!
let arr = (0..<count).map { _ in Int(readLine()!)! }.sorted()
var max = 0
for i in arr.enumerated() {
   if i.element * (count - i.offset) > max {
       max = i.element * (count - i.offset)
    }
}
print(max)
