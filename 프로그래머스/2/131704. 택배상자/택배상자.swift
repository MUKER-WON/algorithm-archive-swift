import Foundation

func solution(_ order:[Int]) -> Int {
    var temp = [Int]()
    var progress = 1
    var result = 0
    
    for box in order {
        if box > progress {
            while box != progress {
                temp.append(progress)
                progress += 1
            }
        }
        if box == progress {
            result += 1
            progress += 1
        } else if box == temp.last ?? 0 {
            result += 1
            temp.removeLast()
        } else {
            break
        }
    }
    return result
}



