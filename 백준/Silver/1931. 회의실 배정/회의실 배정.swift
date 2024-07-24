let meetingCount = Int(readLine()!)!
var time = (0..<meetingCount).map { _ in readLine()!.split(separator: " ").map { Int($0)! }}
time.sort { $0[1] < $1[1] || $0[1] == $1[1] && $0[0] < $1[0] }
var endTime = -1
var count = 0
for i in time {
    if i[0] >= endTime {
        endTime = i[1]
        count += 1
    }
}
print(count)