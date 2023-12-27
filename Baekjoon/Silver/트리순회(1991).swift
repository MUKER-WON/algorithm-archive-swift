//
//  트리순회(1991).swift
//  Algorithm
//
//  Created by Muker on 12/27/23.
//  https://www.acmicpc.net/problem/1991

import Foundation

//MARK: - 문제 풀이 1

func 백준_트리순회() {
	
	let N = Int(readLine()!)!
	var dic = [String:[String]]()

	(0..<N).map { _ in readLine()!.split { $0 == " " }.map { String($0) } }
		.forEach { dic[$0[0]] = [$0[1],$0[2]] }

	func preorder(root: String) -> String {
		if root == "." { return "" }
		return root + preorder(root: dic[root]![0]) + preorder(root: dic[root]![1])
	}

	func inorder(root: String) -> String {
		if root == "." { return "" }
		return inorder(root: dic[root]![0]) + root +  inorder(root: dic[root]![1])
	}

	func postorder(root: String) -> String {
		if root == "." { return "" }
		return postorder(root: dic[root]![0]) + postorder(root: dic[root]![1]) + root
	}

	print(preorder(root: "A"))
	print(inorder(root: "A"))
	print(postorder(root: "A"))
	
}
