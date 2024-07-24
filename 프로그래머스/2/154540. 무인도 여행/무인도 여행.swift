import Foundation

func solution(_ maps:[String]) -> [Int] {
    let dy = [0,0,1,-1], dx = [1,-1,0,0]
    var myMap = [[String]]()
    var result = [Int]()
    for i in maps { myMap.append(i.map {String($0)}) }
    
    func bfs(_ y: Int, _ x: Int) -> Int {
        var queue = [(y,x)]
        var sum = 0
         while !queue.isEmpty {
            let yx = queue.removeFirst(), y = yx.0, x = yx.1
             if myMap[y][x] != "X" {
                 sum += Int(myMap[y][x])!
                 myMap[y][x] = "X"
                 
                 for mv in 0..<4 {
                     let my = dy[mv] + y
                     let mx = dx[mv] + x
                     
                     guard my>=0 && my<maps.count && mx>=0 && mx<maps[0].count else {continue}
                     
                     queue.append((my,mx))
                 }
             }
         }
        return sum
    }
    
    for i in 0..<maps.count {
        for j in 0..<maps[0].count {
            var n = bfs(i,j)
            if n>0 {result.append(n)}
        }
    }
    
    return result.isEmpty ? [-1] : result.sorted()
}