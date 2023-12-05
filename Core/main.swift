import Foundation

let useQuestionArray = false

if useQuestionArray, let submit = questionArray.first {
	print("========= QuestionArray 입출력 =========")
	submit()
	print("======================================")
} else {
	print("== QuestionArray를 사용하지 않고 있습니다. ==")
}
//---------------------------------------------------------------------//


let N = Int(readLine()!)!
var arr = (0..<N).map { _ in readLine()!.split { $0 == " " } }
for k in 0..<N {
	for i in 0..<N {
		for j in 0..<N {
			if arr[i][k] == "1" && arr[k][j] == "1" {
				arr[i][j] = "1"
				print("arr \(i),\(k)는 1, arr \(k),\(j)도 1")
				print(i,j)
				print("k: \(k)")
			}
		}
	}
}
arr.forEach { print($0.joined(separator: " ")) }
