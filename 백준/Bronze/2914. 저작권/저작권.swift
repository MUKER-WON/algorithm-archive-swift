let p = readLine()!.split {$0==" "}.map {Int($0)!}
print(p[0]*(p[1]-1)+1)