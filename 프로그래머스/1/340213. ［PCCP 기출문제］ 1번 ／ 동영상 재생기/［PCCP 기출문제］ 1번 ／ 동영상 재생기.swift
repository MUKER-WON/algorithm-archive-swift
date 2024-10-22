import Foundation

func solution(
    _ video_len:String,
    _ pos:String,
    _ op_start:String,
    _ op_end:String,
    _ commands:[String]
) -> String {
    let tempVideoLen = video_len.split { $0 == ":" }.map { Int($0)! }
    let tempPos = pos.split { $0 == ":" }.map { Int($0)! }
    let tempOpStart = op_start.split { $0 == ":" }.map { Int($0)! }
    let tempOpEnd = op_end.split { $0 == ":" }.map { Int($0)! }
    
    let videoLen = tempVideoLen[0]*60+tempVideoLen[1]
    let opStart = tempOpStart[0]*60+tempOpStart[1]
    let opEnd = tempOpEnd[0]*60+tempOpEnd[1]
    var pos = tempPos[0]*60+tempPos[1]
    
    for command in commands {
        if pos >= opStart && pos < opEnd { pos = opEnd }
        
        switch command {
            case "next":
                pos += 10
                if pos > videoLen { pos = videoLen }
            case "prev":
                pos -= 10
                if pos < 0 { pos = 0 }
            default: continue
        }
    }
    if pos >= opStart && pos < opEnd { pos = opEnd }
    
    return "\(String(format: "%02d", pos/60)):\(String(format: "%02d", pos%60))"
}