while let input = readLine(), input != "end" {
    var pass = [false, true, true]
    let vowel = ["a","e","i","o","u"]
    let str = input.map { String($0) }
    
    (0..<str.count).forEach {
        if vowel.contains(str[$0]) {
            pass[0] = true
        }
        if $0 > 0 && !(str[$0] == "e" || str[$0] == "o") {
            if str[$0-1] == str[$0] {
                pass[1] = false
            }
        }
        if $0 > 1 {
            let sequence = str[$0-2...$0]
            let allVowel = sequence.allSatisfy {
                vowel.contains($0)
            }
            let allConsonant = sequence.allSatisfy {
                !vowel.contains($0)
            }
            if [allVowel, allConsonant].contains(true) {
                pass[2] = false
            }
        }
    }
    print("<\(input)> is \(pass.allSatisfy { $0 == true } ? "acceptable" : "not acceptable").")
}