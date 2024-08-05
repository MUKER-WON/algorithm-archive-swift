let N = readLine()!
print(readLine()!.split { $0==" " }.filter { $0 == N }.count)