func solution(_ expressions:[String]) -> [String] {
    var unknown = [[String]]()
    var known = [[String]]()
    var radixs = (2...9).map { $0 }
    var ans = [String]()
    
    for expression in expressions {
        let str = expression.split { $0 == " " }.map { String($0) }
        
        for i in stride(from: 0, through: 4, by: 2) {
            if let num = Int(str[i].map({ String($0) }).last!), num < 10 {
                radixs = radixs.filter {
                    return $0 > num
                }
            }
        }
        
        if str[4] == "X" {
            unknown.append(str)
        } else {
            known.append(str)
        }
    }
    
    for str in known {
        radixs = radixs.filter { radix in
            guard let a = Int(str[0], radix: radix),
                  let b = Int(str[2], radix: radix),
                  let c = Int(str[4], radix: radix)
            else { return false }
            
            return str[1] == "+" ? a+b == c : a-b == c
        }
    }
    
    for str in unknown {
        var set = Set<String>()
        for radix in radixs {
            guard let a = Int(str[0], radix: radix),
                  let b = Int(str[2], radix: radix)
            else { continue }
            
            let num = str[1] == "+" ? a+b : a-b
            set.insert(String(num, radix: radix))
        }
        let ansNum = set.count != 1 ? "?" : String(set.first!)
        ans += [str[0...3].joined(separator: " ") + " \(ansNum)"]
    }
    
    return ans
}