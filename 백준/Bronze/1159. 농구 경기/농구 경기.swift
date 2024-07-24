let player = Int(readLine()!)!
var countDictionary = [String: Int]()
for _ in 1...player {
    let firstWord = String(readLine()!.first!)
    countDictionary[firstWord] = (countDictionary[firstWord] ?? 0) + 1
    
}
let result = countDictionary.filter { $0.value >= 5 }.keys.sorted().joined()
print(result == "" ? "PREDAJA" : result)