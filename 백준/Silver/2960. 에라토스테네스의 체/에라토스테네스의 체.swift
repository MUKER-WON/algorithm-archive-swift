let NK = readLine()!.split {$0==" "}.map {Int($0)!}, N = NK[0], K = NK[1]
var arr = Array((0...N)), count = 0
for i in 2...N {
    for j in stride(from: i, through: N, by: i) {
        if arr[j] != 0 {
            count += 1
            if count == K {
                print(arr[j])
            }
            arr[j] = 0
        }
    }
}