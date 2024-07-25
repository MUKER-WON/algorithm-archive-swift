var input = readLine()!.split(separator: " ").map { Int($0)! }

let dice1 = input[0]
let dice2 = input[1]
let dice3 = input[2]
var top = 0

for i in input {
    if i > top {
        top = i
    }
}

if dice1 == dice2 && dice2 == dice3 {
    print( 10000 + dice1 * 1000)
} else if dice1 == dice2 || dice1 == dice3 {
    print( 1000 + dice1 * 100)
} else if dice2 == dice3 {
    print( 1000 + dice2 * 100)
} else {
    print(top * 100)
}
