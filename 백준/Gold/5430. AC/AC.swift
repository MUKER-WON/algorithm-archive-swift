loop: for _ in 0..<Int(readLine()!)! {
    let p = readLine()!
    _ = readLine()
    let a = readLine()!.split { $0 == "[" || $0 == "]" || $0 == "," }
    var (t,l,r) = (false,0,a.count)
    for c in p {
        if c == "R" {
            t.toggle()
        } else {
            if l > r {
                print("error")
                continue loop
            }
            if t { r -= 1 } else { l += 1 }
        }
    }
    if l > r { print("error") } else {
        print("[\(t ? a[l..<r].reversed().joined(separator: ",") : a[l..<r].joined(separator: ","))]")
    }
}