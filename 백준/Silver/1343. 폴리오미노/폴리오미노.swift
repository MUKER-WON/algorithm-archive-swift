import Foundation

var input = readLine()!
var result = ""
var count = 0

for i in input {
    if count == 4 {
        result += "AAAA"
        count = 0
        
    }
    if i == "X" {
        count += 1
    }
    if i == "." {
        if count == 0 {
            result += "."
            continue
        }
        if count == 2 {
            result += "BB."
            count = 0
        } else {
            count = 1
            break
        }
    }
}
if count == 2 {
    count = 0
    result += "BB"
}
if count == 4 {
    count = 0
    result += "AAAA"
}
count == 0 ? print(result) : print(-1)