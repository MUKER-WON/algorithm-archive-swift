let arrayInput = Array(readLine()!).sorted(by: >)
arrayInput.last == "0" && arrayInput.reduce(0, { $0 + Int(String($1))! }) % 3 == 0 ? print(String(arrayInput)) : print(-1)