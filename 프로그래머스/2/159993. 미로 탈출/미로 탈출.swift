import Foundation

func solution(_ maps:[String]) -> Int {
    var nMaps = [[String]]()
    var start = (0,0)
    var lever = (0,0)
    var exit = (0,0)
    
    for i in 0..<maps.count {
        let map = maps[i].map { String($0) }
        nMaps += [map]
        
        for j in 0..<maps[i].count {
            switch map[j] {
            case "S": start = (i,j)
            case "L": lever = (i,j)
            case "E": exit = (i,j)
            default: break
            }
        }
    }
    
    func search(start: (Int, Int), arrival: (Int, Int)) -> Int {
        let direction = [(0,1),(0,-1),(1,0),(-1,0)]
        var queue = [(start.0, start.1, 0)]
        var visited = Array(repeating: Array(repeating: false, count: maps[0].count), count: maps.count)
        visited[start.0][start.1] = true
        var distance = -1
        
        while !queue.isEmpty {
            let now = queue.removeFirst()
            if arrival == (now.0, now.1) {
                distance = now.2
                break
            }
            
            for d in direction {
                let dy = now.0 + d.0
                let dx = now.1 + d.1
                
                guard dy >= 0 && dy < maps.count && dx >= 0 && dx < nMaps[1].count else { continue }
                guard nMaps[dy][dx] != "X" && !visited[dy][dx] else { continue }
                
                queue.append((dy,dx,now.2+1))
                visited[dy][dx] = true
            }
        }
        return distance
    }
    
    func answer() -> Int {
        var startTolever = 0
        var leverToExit = 0
        
        startTolever = search(start: start, arrival: lever)
        guard startTolever != -1 else { return -1 }
        leverToExit = search(start: lever, arrival: exit)
        guard leverToExit != -1 else { return -1 }
 
        return startTolever + leverToExit
    }
    
    
    return answer()
}