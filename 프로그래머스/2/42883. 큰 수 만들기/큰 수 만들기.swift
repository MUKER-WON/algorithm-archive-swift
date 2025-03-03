import Foundation

func solution(_ number:String, _ k:Int) -> String {
    
    var stack = [Character]()
    var removeCnt = k
    
    for n in number {
        while removeCnt > 0, !stack.isEmpty, stack.last! < n {
            stack.removeLast()
            removeCnt -= 1
        }
        stack.append(n)
    }
    
    return String(stack[0..<stack.count-removeCnt])
}