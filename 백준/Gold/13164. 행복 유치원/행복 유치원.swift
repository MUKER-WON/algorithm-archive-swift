let I = readLine()!.split { $0 == " " }.map { Int($0)! }
let S = readLine()!.split { $0 == " " }.map { Int($0)! }
let diff = (0..<I[0]-1).map { S[$0+1]-S[$0] }.sorted()
print(diff[0..<I[0]-I[1]].reduce(0,+))