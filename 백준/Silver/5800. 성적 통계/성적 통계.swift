for i in 1...Int(readLine()!)! {
    let score = readLine()!.split { $0 == " " }.map { Int($0)! }[1...].sorted(by: >)
    var n = 0
    
    for j in 0..<score.count-1 { n = max(n, score[j]-score[j+1]) }

    print("Class \(i)\nMax \(score.first!), Min \(score.last!), Largest gap \(n)")
}