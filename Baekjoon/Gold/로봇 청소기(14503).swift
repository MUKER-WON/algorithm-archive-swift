//
//  로봇 청소기.swift
//  Algorithm
//
//  Created by Muker on 12/3/23.
//

import Foundation

func gold_로봇_청소기() {
	let NM = readLine()!.split { $0 == " " }.map { Int($0)! }, N = NM[0]
	let rcd = readLine()!.split { $0 == " " }.map { Int($0)! }
	let direction = [(-1,0),(0,1),(1,0),(0,-1)]
	var (y,x) = (rcd[0],rcd[1]), d = rcd[2] // y,x좌표 d: 방향(0: 북, 1: 동, 2: 남, 3: 서)
	var room = (0..<N).map { _ in readLine()!.split { $0 == " " }.map { String($0) } }
	var clean = 0
	
loop: while true {
	if room[y][x] == "0" {
		room[y][x] = "2"
		clean += 1
	}
	// 반시계 방향으로 청소할 곳을 찾음, 무조건 반시계로 돌리고 봄
	for _ in 0..<4 {
		d = (d+3)%4
		let newY = direction[d].0+y
		let newX = direction[d].1+x
		guard newY >= 0 && newY < room.count && newX >= 0 && newX < room[0].count
		else { continue }
		if room[newY][newX] == "0" {
			y = newY
			x = newX
			continue loop
		}
	}
	// 4방향 청소할 곳이 없을 때
	let back = direction[(d+2)%4]
	let backY = back.0+y
	let backX = back.1+x
	if room[backY][backX] == "1" { break }
	y = backY
	x = backX
}
	print(clean)
	room.forEach { print($0) }
	
}
