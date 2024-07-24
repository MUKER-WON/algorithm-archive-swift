let f=readLine()!.split(separator: " ").map { Int($0)! }
let y=f[0], x=f[1]
if y <= 1 {print(1)}
else if y<=2 {print(min(4,(x-1)/2+1))}
else if x<=4 {print(x)}
else if x<=6 {print(4)}
else {print(x-2)}