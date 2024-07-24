_ = readLine()
let A = readLine()!
print(min(A.split { $0 == "B" }.count, A.split { $0 == "R" }.count)+1)