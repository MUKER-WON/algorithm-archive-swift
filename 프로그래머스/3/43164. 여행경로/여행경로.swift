import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    var dic = [String: [String]]()
    tickets.forEach { dic[$0[0], default: []].append($0[1]) }
    dic = dic.mapValues { $0.sorted(by: >) }
    
    var stack = ["ICN"]
    var ans = [String]()
    
    while !stack.isEmpty {
        let n = stack.last!
        if let airPort = dic[n], !airPort.isEmpty {
            stack += [dic[n]!.removeLast()]
        } else {
            ans += [stack.removeLast()]
        }
    }
    return ans.reversed()
}