let peopleNumber = readLine()!
var line = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var minute = [0]
for i in line.enumerated() { minute.append(minute[i.offset] + i.element) }
print(minute.reduce(0,+))