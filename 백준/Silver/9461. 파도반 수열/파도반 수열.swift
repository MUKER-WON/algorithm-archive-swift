var a = [0,1,1,1,2,2,3,4,5,7,9]
for i in 11...100 {
    a.append(a[i-2] + a[i-3])
}
for _ in 0..<Int(readLine()!)! {
    print(a[Int(readLine()!)!])
}