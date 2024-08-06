let n = Int(readLine()!)!
var members: [(Int, Int, String)] = []

for count in 1...n {
    let ageAndName = readLine()!.split(separator: " ")
    let age = Int(ageAndName[0])!
    let name = String(ageAndName[1])
    members.append((count, age, name))
}

// 정렬할 때 기준을 부여
let sortedMembers = members.sorted {
    if $0.1 == $1.1 {
        return $0.0 < $1.0
    }
    return $0.1 < $1.1
}

for member in sortedMembers {
    print(member.1, member.2)
}