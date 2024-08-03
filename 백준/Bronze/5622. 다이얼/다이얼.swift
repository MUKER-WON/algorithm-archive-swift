let input = readLine()!
var result = 0
for i in input {
    switch i {
    case "A", "B", "C":
        result += 3
    case "D", "E", "F":
        result += 4
    case "G", "H", "I":
        result += 5
    case "J", "K", "L":
        result += 6
    case "M", "N", "O":
        result += 7
    case "P", "Q", "R", "S":
        result += 8
    case "T", "U", "V":
        result += 9
    case "W", "X", "Y", "Z":
        result += 10
    default:
        break
    }
}
print(result)