import Foundation

func solution(_ num_list:[Int], _ n:Int) -> [Int] {
    num_list[n...].map { $0 } + num_list[..<n]
}