import Foundation

func solution(_ str_list:[String]) -> [String] {
    for (i,v) in str_list.enumerated() {
        if v == "l" {
            return str_list[..<i].map { $0 }
        }
        if v == "r" {
            return str_list[(i+1)...].map { $0 }
        }
    }
    return []
}
