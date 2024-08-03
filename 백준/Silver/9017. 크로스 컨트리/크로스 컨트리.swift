for _ in 0..<Int(readLine()!)! {
    _ = readLine()!
    var score = readLine()!.split { $0 == " " }.map { Int($0)! }
    var team = [Int: [Int]]()
    Dictionary(grouping: score, by: { $0 })
        .filter { $0.value.count < 6 }
        .forEach { fallTeam in
            score.removeAll { $0 == fallTeam.key }
        }
    score.enumerated().forEach {
        team[$0.element, default: []].append($0.offset+1)
    }
    print(
        team.sorted {
            let team1 = $0.value[0...3].reduce(0,+)
            let team2 = $1.value[0...3].reduce(0,+)
            return team1 == team2
            ? $0.value[4] < $1.value[4]
            : team1 < team2
        }[0].key
    )
}