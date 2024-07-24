func solution(_ priorities:[Int], _ location:Int) -> Int {
    var arr = priorities
    var max = arr.max()!
    var pointer = 0
    var count = 1
    while true {
        let point = pointer % priorities.count
        if arr[point] == max {
            if point == location {
                break
            }
            else {
                arr[point] = 0
                count += 1
                max = arr.max()!
            }
        }
        pointer += 1
    }
    return count
}