let n = Int(readLine()!)!
var young = ("",Int.max), old = ("",0)

for i in 0..<n {
    let person = readLine()!.split { $0 == " " }
    let age = Int(person[1])! + (Int(person[2])!*31) + (Int(person[3])!*365)
    if young.1 > age { 
        young.0 = String(person[0])
        young.1 = age
    }
    if old.1 < age {
        old.0 = String(person[0])
        old.1 = age
    }
}
print(old.0)
print(young.0)