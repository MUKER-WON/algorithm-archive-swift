let n = Int(readLine()!)!

for i in 1... {
	if i*(i+1)/2 > n {
		print(i-1)
		break
	}
}
