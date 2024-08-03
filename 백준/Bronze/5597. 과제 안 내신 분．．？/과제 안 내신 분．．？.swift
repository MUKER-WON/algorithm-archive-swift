var submittee = (1...28).map { _ in Int(readLine()!)! }
(1...30).forEach { if !submittee.contains($0) { print($0)} }