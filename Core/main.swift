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

func solution(_ number:String, _ k:Int) -> String {
	var count = k
	var stack = [Character]()
	
	for num in number {
		while count > 0
				&& !stack.isEmpty
				&& stack.last! < num
		{
			stack.removeLast()
			count -= 1
		}
		stack.append(num)
	}
	return String(String(stack).prefix(stack.count - count))
}

print(solution("1924", 2))
