for _ in 0..<Int(readLine()!)! {
	let N = readLine()!.split { $0 == " " }.map { Int($0)! }
	let (막대길이, 개미의수) = (N[0],N[1])
	let 개미들 = (0..<개미의수).map { _ in Int(readLine()!)! }
	var (최대,최소) = (0,0)
	
	for i in 개미들 {
		최대 = max(최대,max(막대길이-i,i))
		최소 = max(최소,min(막대길이-i,i))
	}
	
	print("\(최소) \(최대)")
}