func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {

    var result = [Int]()
    var arr = [[Int]]()
    // 배열 초기화
    for i in 0..<rows {
        arr.append(Array((i*columns)+1...(i*columns)+columns))
    }
    // 회전회오리!
    for i in queries {
        let startY = i[0]-1, startX = i[1]-1, endY = i[2]-1, endX = i[3]-1
        // block에 테두리를 4개로 잘라 담음
        var block = Array(repeating: [Int](), count: 4)
        // 가로블록 구하기
        for i in startX...endX {
            block[0].append(arr[startY][i])
            block[2].insert(arr[endY][i], at:0)
        }
        // 세로블록 구하기, 조건문이 성립이 안된다면 세로블록을 구할 필요 없음
        if startY+1 <= endY-1 {
            for i in startY+1...endY-1 {
                block[1].append(arr[i][endX])
                block[3].insert(arr[i][startX], at:0)
            }
        }
        var newBlock = block.flatMap {$0}
        result.append(newBlock.min()!)
        for i in startY...endY {
            arr[i][startX] = newBlock.popLast()!
        }
        for i in startX+1...endX {
            arr[endY][i] = newBlock.popLast()!
        }
        for i in (startY...endY-1).reversed() {
            arr[i][endX] = newBlock.popLast()!
        }
        if startX+1 <= endX-1 {
            for i in (startX+1...endX-1).reversed() {
            arr[startY][i] = newBlock.popLast()!
            }
        }
    }
    return result
}