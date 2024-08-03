for _ in 0..<Int(readLine()!)! {
    var dic = [String: Int]()
    for _ in 0..<Int(readLine()!)! {
        let wear = readLine()!.split(separator: " ").map { String($0) }
        dic[wear[1]] = (dic[wear[1]] ?? 0) + 1
    }
    print(dic.values.reduce(1) { $0 * ($1+1) }-1)
}