var a = [0,1,2]
for i in 3...1001 {
    a.append((a[i-1] + a[i-2]) % 10_007)
}
print(a[Int(readLine()!)!])