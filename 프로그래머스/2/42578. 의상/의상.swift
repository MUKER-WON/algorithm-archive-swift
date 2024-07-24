func solution(_ clothes:[[String]]) -> Int {
    var dic = [String: Int]()
    for i in clothes {
        dic[i[1]] = (dic[i[1]] ?? 0) + 1
    }
    return (dic.values.reduce(1) { $0 * ($1+1) })-1
}