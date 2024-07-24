import Foundation

var dic = Dictionary(uniqueKeysWithValues: (0...9).map { ($0,0) } )
for i in readLine()!.map { Int(String($0))! } {
    dic[i] = dic[i]!+1
}
let sixnine = Int(round(((Double(dic[6]!) + Double(dic[9]!)) / 2)))
dic[9] = sixnine
dic[6] = sixnine
var num = 0
for i in dic.values {
    num = max(num, i)
}
print(num)