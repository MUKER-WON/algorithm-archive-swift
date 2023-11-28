//
//  별 찍기 - 10(2447).swift
//  Algorithm
//
//  Created by Muker on 11/28/23.
//

import Foundation

/// 프랙탈 도형: 재귀적이거나 반복적인 작업으로 만들어지는 패턴 도형
///
/// 키워드: block의 '가운데' 부분은 공백이다.
/// N = 3 일 때 y,x 좌표값으로 (0,0),(0,1),(0,2),(1,0),(공백),(1,2)...
///
/// ***
/// * * <- 5번째 순서에 공백이 생긴다.
/// ***
///
/// N = 9 일 때는, N = 3 일 때의 모양을 '*'이라 생각하고 가운데 공백을 두면 되는 도형을 만든다.
///
/// *********
/// * ** ** *
/// *********
/// ***   ***
/// * *   * * <- 마찬가지로 5번째 순서에 공백이 생긴다.
/// ***   ***
/// *********
/// * ** ** *
/// *********
///
func gold_별찍기_10() {
	
	/// y, x: arr의 y,x 좌표
	/// N: 현재 도형의 size (3의 배수)
	/// blank: 9등분 중 5번째에 해당하는 프랙탈도형이 기입되지 않는 곳
	func fractal(y: Int, x: Int, N: Int, blank: Bool) {
		guard !blank else { return }
		
		if N == 1 {
			arr[y][x] = "*"
			return
		}
		
		let size = N/3
		var count = 0
		
		// 해당 2중첩 반복문은 현재도형을 9등분해서 재귀할 수 있게 한다.
		// 5번째는 blank를 true로 만들어 비어두게 한다.
		for i in stride(from: y, to: y+N, by: size) {
			for j in stride(from: x, to: x+N, by: size) {
				count += 1
				if count == 5 {
					fractal(y: i, x: j, N: size, blank: true)
				} else {
					fractal(y: i, x: j, N: size, blank: false)
				}
			}
		}
	}

	var N = Int(readLine()!)!
	var arr = Array(repeating: Array(repeating: " ", count: N), count: N)

	fractal(y: 0, x: 0, N: N, blank: false)

	arr.forEach { print($0.joined()) }
}

