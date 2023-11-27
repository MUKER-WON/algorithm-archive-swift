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


