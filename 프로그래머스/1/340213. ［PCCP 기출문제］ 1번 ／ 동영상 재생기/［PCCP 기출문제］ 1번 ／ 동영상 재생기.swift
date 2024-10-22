import Foundation

func solution(
    _ video_len:String,
    _ pos:String,
    _ op_start:String,
    _ op_end:String,
    _ commands:[String]
) -> String {
    let videoLen = stringToTime(video_len)
    let opStart = stringToTime(op_start)
    let opEnd = stringToTime(op_end)
    var pos = stringToTime(pos)
    
    for command in commands {
        if pos >= opStart && pos < opEnd { pos = opEnd }
        
        switch command {
            case "next": pos = min(pos+10, videoLen)
            case "prev": pos = max(pos-10, 0)
            default: continue
        }
    }
    if pos >= opStart && pos < opEnd { pos = opEnd }
    
    return "\(String(format: "%02d", pos/60)):\(String(format: "%02d", pos%60))"
}

func stringToTime(_ time: String) -> Int {
    let time = time.split { $0 == ":" }.map { Int($0)! }
    return time[0]*60 + time[1]
}