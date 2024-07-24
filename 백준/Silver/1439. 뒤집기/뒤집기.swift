let a=readLine()!
print(min(a.split{$0=="0"}.count,a.split{$0=="1"}.count))