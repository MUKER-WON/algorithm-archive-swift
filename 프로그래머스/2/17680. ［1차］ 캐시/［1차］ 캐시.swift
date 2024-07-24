func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var cache = [String]()
    var time = 0
    for i in cities {
        let lower = i.lowercased()
        if cache.contains(lower) {
            cache.remove(at: cache.firstIndex(of: lower)!)
            cache.append(lower)
            time += 1
            continue
        } else {
            cache.append(lower)
            time += 5
            if cache.count > cacheSize { cache.removeFirst() }
        }
    }
    return time
}