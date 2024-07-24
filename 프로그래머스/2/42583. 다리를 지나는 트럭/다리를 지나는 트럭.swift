func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var bridge = Array(repeating: 0, count: bridge_length)
    var trucks = truck_weights.reversed().map { $0 }
    var time = 0
    var bridgeWeight = 0
    var pointer = 0
    
    while !trucks.isEmpty {
        time += 1
        bridgeWeight -= bridge[pointer]
        pointer += 1
        
        if trucks.last! + bridgeWeight <= weight {
            let t = trucks.removeLast()
            bridgeWeight += t
            bridge.append(t)
        } else { bridge.append(0) }
        
    }
    return time + bridge_length
}