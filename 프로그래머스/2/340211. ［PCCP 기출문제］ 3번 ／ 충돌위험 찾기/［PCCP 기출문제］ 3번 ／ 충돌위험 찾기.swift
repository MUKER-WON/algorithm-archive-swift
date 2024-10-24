import Foundation

func solution(
    _ points:[[Int]],
    _ routes:[[Int]]
) -> Int {
    var drivingRoutes = [Int: [Point]]()
    var ans = 0
    
    for i in 0..<routes.count {
        var step = 0
        
        for j in 1..<routes[i].count {
            let (startIndex, endIndex) = (routes[i][j-1] - 1, routes[i][j] - 1)
            var now = Point(y: points[startIndex][0], x: points[startIndex][1])
            let end = Point(y: points[endIndex][0], x: points[endIndex][1])
            
            if step == 0 {
                drivingRoutes[step, default: []].append(now)
            }
            
            while true {
                if now.y > end.y {
                    now = Point(y: now.y - 1, x: now.x)
                } else if now.y < end.y {
                    now = Point(y: now.y + 1, x: now.x)
                } else {
                    if now.x > end.x {
                        now = Point(y: now.y, x: now.x - 1)
                    } else if now.x < end.x {
                        now = Point(y: now.y, x: now.x + 1)
                    }
                }
                step += 1
                drivingRoutes[step, default: []].append(now)
                if now == end { break }
            }
        }
    }
    
    for i in 0... {
        guard let route = drivingRoutes[i] else { break }
        
        let a = Dictionary(grouping: route) { $0 }
            .mapValues { $0.count }
            .filter { $0.value > 1 }
            .count
        ans += a
    }
    
    return ans
}

struct Point: Hashable {
    let y: Int
    let x: Int
}