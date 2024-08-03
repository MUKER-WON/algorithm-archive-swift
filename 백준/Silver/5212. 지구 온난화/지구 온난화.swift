let move = [(0,1),(0,-1),(1,0),(-1,0)]
var valueY = (Int.max,-1)
var valueX = (Int.max,-1)

let yx = readLine()!.split(separator: " ").map { Int($0)! }
var map = [[String]]()

for _ in 0..<yx[0] {
    map.append(readLine()!.map { String($0) })
}

var newMap = map

for y in 0..<yx[0] {
    for x in 0..<yx[1] {
        if map[y][x] == "X" {
            var count = 0
            for i in move {
                let ny = y+i.0
                let nx = x+i.1
                guard ny >= 0 && ny < yx[0] && nx >= 0 && nx < yx[1] else { continue }
                guard map[ny][nx] == "X" else { continue }
                count += 1
            }
            if count > 1 {
                valueY.0 = min(valueY.0,y)
                valueY.1 = max(valueY.1,y)
                valueX.0 = min(valueX.0,x)
                valueX.1 = max(valueX.1,x)
            } else {
                newMap[y][x] = "."
            }
            
        }
    }
}

for i in valueY.0...valueY.1 {
    print(newMap[i][valueX.0...valueX.1].joined())
}
