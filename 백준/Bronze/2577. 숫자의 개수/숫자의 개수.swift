var input = [0,0,0]
for i in 0..<3 { input[i] = Int(readLine()!)! }
var a = Array(String(input.reduce(1,*)))
var dictionary = [0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0]
for i in a {
    switch i {
    case "0": dictionary[0]! += 1
    case "1": dictionary[1]! += 1
    case "2": dictionary[2]! += 1
    case "3": dictionary[3]! += 1
    case "4": dictionary[4]! += 1
    case "5": dictionary[5]! += 1
    case "6": dictionary[6]! += 1
    case "7": dictionary[7]! += 1
    case "8": dictionary[8]! += 1
    case "9": dictionary[9]! += 1
    default: continue
    }
}
for i in dictionary.sorted(by: { $0.key < $1.key}) {
    print(i.value)
}
