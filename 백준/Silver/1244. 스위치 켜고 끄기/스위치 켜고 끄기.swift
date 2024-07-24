let aN = Int(readLine()!)!
var arr = [0]+readLine()!.split(separator: " ").map { Int($0)! }
let pN = Int(readLine()!)!
for _ in 0..<pN {
    let P = readLine()!.split(separator: " ").map { Int($0)! }
    let G = P[0], S = P[1]
    if G == 1 {
        for i in 1... {
            let multi = i*S
            if multi > aN { break }
            arr[multi] = arr[multi]>0 ? 0 : 1
        }
    } else {
        arr[S] = arr[S]>0 ? 0 : 1
        for i in 1... {
            let min = S-i, max = S+i
            guard min > 0 && max <= aN && arr[min]==arr[max] else { break }
            if arr[min]>0 { arr[min]=0; arr[max]=0 }
            else { arr[min]=1; arr[max]=1 }
        }
    }
}
for i in stride(from: 1, to: arr.count, by: 20) {
    print(i+20>arr.count ? arr[i...].map{String($0)}.joined(separator: " ") : arr[i...i+19].map{String($0)}.joined(separator: " "))
}