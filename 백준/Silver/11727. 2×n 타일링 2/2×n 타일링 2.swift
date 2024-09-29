var a = [0,1,3,5]
for i in 4...1000 {
    a.append((a[i-1] + a[i-2] * 2) % 10007)
}
print(a[Int(readLine()!)!])