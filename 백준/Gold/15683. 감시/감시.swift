typealias Coor = (Int, Int)
let I = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N,M) = (I[0],I[1])
let direction = [(1,0),(0,1),(-1,0),(0,-1)] // 하,우,상,좌
var ans = Int.max

var camera = [(Int,Int,Int)]()
var office = (0..<N).map { i -> [Int] in
    let x = readLine()!.split { $0 == " " }.map { Int($0)! }
    (0..<M).forEach { j in
        if 1...5 ~= x[j] { camera += [(i,j,x[j])] }
    }
    return x
}

func observe(_ p: Coor, _ d: Int) -> [Coor] {
    var observeArr = [(Int, Int)]()
    var p = p
    while true {
        let (dy, dx) = (p.0 + direction[d].0, p.1 + direction[d].1)
        guard dy >= 0 && dy < N && dx >= 0 && dx < M && office[dy][dx] != 6 else { break }
        p = (dy,dx)
        if office[dy][dx] != 0 {
            continue
        }
        observeArr += [(dy, dx)]
    }
    return observeArr
}

func task(_ count: Int) {
    if count == camera.count {
        ans = min(ans, office.flatMap { $0 }.filter { $0 == 0 }.count)
        return
    }
    let camera = camera[count]
    switch office[camera.0][camera.1] {
    case 1:
        for i in 0..<4 {
            let arr = observe((camera.0, camera.1), i)
            arr.forEach { office[$0.0][$0.1] = 7 }
            task(count+1)
            arr.forEach { office[$0.0][$0.1] = 0 }
        }
    case 2:
        for i in 0...1 {
            var arr = observe((camera.0, camera.1), i)
            arr += observe((camera.0, camera.1), i+2)
            arr.forEach { office[$0.0][$0.1] = 7 }
            task(count+1)
            arr.forEach { office[$0.0][$0.1] = 0 }
        }
    case 3:
        for i in 0..<4 {
            var arr = observe((camera.0, camera.1), i)
            arr += observe((camera.0, camera.1), (i+1)%4)
            arr.forEach { office[$0.0][$0.1] = 7 }
            task(count+1)
            arr.forEach { office[$0.0][$0.1] = 0 }
        }
    case 4:
        for i in 0..<4 {
            var arr = observe((camera.0, camera.1), i)
            arr += observe((camera.0, camera.1), (i+1)%4)
            arr += observe((camera.0, camera.1), (i+2)%4)
            arr.forEach { office[$0.0][$0.1] = 7 }
            task(count+1)
            arr.forEach { office[$0.0][$0.1] = 0 }
        }
    case 5:
        var arr = [Coor]()
        for i in 0..<4 {
            arr += observe((camera.0, camera.1), i)
        }
        arr.forEach { office[$0.0][$0.1] = 7 }
        task(count+1)
        arr.forEach { office[$0.0][$0.1] = 0 }
    default : return
    }
}

task(0)
print(ans)