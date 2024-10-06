var n = 0
for i in 0..<3 { if let j = Int(readLine()!) { n = j + 3 - i } }
if n % 3 == 0 && n % 5 == 0 {
    print("FizzBuzz")
} else if n % 3 == 0 && n % 5 != 0 {
    print("Fizz")
} else if n % 3 != 0 && n % 5 == 0 {
    print("Buzz")
} else {
    print(n)
}