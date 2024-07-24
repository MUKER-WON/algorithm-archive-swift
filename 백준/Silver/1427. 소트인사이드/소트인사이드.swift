let T = readLine()!.map{Int(String($0))!}.sorted(by: >)
for i in T { print(i, terminator: "") }