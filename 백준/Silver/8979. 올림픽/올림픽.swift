let NK = readLine()!.split { $0 == " " }.map { Int($0)! }, N = NK[0], K = NK[1]
var medals = [[Int]]()

for _ in 0..<N {
    medals.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}

medals.sort {
    $0[1] == $1[1] ? $0[2] == $1[2] ? $0[3] > $1[3] : $0[2] > $1[2] : $0[1] > $1[1]
}

for i in 0..<N {
    if medals[i][0] == K {
        var index = i
        while true {
            guard index > 0 else {
                print(1)
                break
            }
            if medals[index-1][1...] == medals[index][1...] {
                index -= 1
            } else {
                print(index+1)
                break
            }
        }
        break
    }
}