let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0], A = input[1], B = input[2], DA = input[3], DB = input[4]
var turn = 0
var Aarr = [A]
var Barr = [B]
loop:for i in 1...1000 {
    if i == 1000 {
        print("Evil Galazy")
        break
    }
    if turn == 0 {
        var temp = Set<Int>()
        while !Aarr.isEmpty {
            let num = Aarr.popLast()!
            let plusN = num+DA
            let minusN = num-DA
            
            if plusN > N {
                temp.insert(plusN-N)
            } else { temp.insert(plusN) }
            
            if minusN < 1 {
                temp.insert(minusN+N)
            } else { temp.insert(minusN) }
            
        }
        Aarr = Array(temp)
            for j in Aarr {
                if Barr.contains(j) {
                    print(i)
                    break loop
                }
            }
        turn = 1
    } else {
        var temp = Set<Int>()
        while !Barr.isEmpty {
            let num = Barr.popLast()!
            let plusN = num+DB
            let minusN = num-DB
            
            if plusN > N {
                temp.insert(plusN-N)
            } else { temp.insert(plusN) }
            
            if minusN < 1 {
                temp.insert(minusN+N)
            } else { temp.insert(minusN) }
            
        }
        Barr = Array(temp)
        for j in Barr {
            if Aarr.contains(j) {
                print(i)
                break loop
            }
        }
        turn = 0
    }
}