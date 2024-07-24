func solution(_ files: [String]) -> [String] {
    var files = files

    files = files.sorted { file1, file2 in
        let numStartIndex0 = file1.firstIndex(where: { $0.isNumber })!
        let numStartIndex1 = file2.firstIndex(where: { $0.isNumber })!

        let title0 = file1[..<numStartIndex0].lowercased()
        let title1 = file2[..<numStartIndex1].lowercased()

        if title0 == title1 {
            let numEndIndex0 = file1[numStartIndex0...].firstIndex(where: { !$0.isNumber }) ?? file1.endIndex
            let numEndIndex1 = file2[numStartIndex1...].firstIndex(where: { !$0.isNumber }) ?? file2.endIndex

            let num0 = Int(file1[numStartIndex0..<numEndIndex0])!
            let num1 = Int(file2[numStartIndex1..<numEndIndex1])!

            return num0 < num1
        } else {
            return title0 < title1
        }
    }

    return files
}