import Foundation

while let input = readLine(), input != "0" {
    print(input == String(input.reversed()) ? "yes" : "no")
}
