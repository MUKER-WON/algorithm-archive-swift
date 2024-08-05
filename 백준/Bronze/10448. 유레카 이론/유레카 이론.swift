var nums = [Int]()

for i in 1...45 {
    nums.append(i*(i+1)/2)
}

for _ in 0..<Int(readLine()!)! {
    let N = Int(readLine()!)!
    var result = 0
loop: for i in 0..<45 {
        for j in 0..<45 {
            for k in 0..<45 {
                if nums[i]+nums[j]+nums[k] == N {
                    result = 1
                    break loop
                }
            }
        }
    }
    print(result)
}