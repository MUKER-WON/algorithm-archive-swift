let input = readLine()!.split { $0 == " " }.map { Int($0)! }
let N = input[0], score = input[1], P = input[2]
var arr = [Int](), result = -1

if N > 0 {
    arr += readLine()!.split { $0 == " " }.map { Int($0)! }
    let  dic = Dictionary(grouping: arr, by: { $0 }).mapValues { $0.count }
    
    for i in 0..<arr.count {
        if score >= arr[i] {
            if score == arr[i] && i+dic[arr[i]]! >= P { break }
            else { result = i+1; break }
        }
    }
    
    if result == -1 && P > N { result = N+1 }
    print(result)
    
} else { print(1) }