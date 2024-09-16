let f = { readLine()!.split { $0 == " " }.map { Int($0)! } }
let (a,b,c) = (f(),f(),f())

print(((b[0]-a[0]) * (c[1]-a[1]) - (c[0]-a[0]) * (b[1]-a[1])).signum())
