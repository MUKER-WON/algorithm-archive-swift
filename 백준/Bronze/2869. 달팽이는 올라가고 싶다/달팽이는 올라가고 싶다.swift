let r = readLine()!.split(separator: " ").map { Int($0)! }
let tm = r[2] - r[1]
let mm = r[0] - r[1] 
var result = tm / mm
let ss = tm % mm
if ss != 0 {
    result += 1
}
print(result)