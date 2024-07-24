//
//  Heap.swift
//  Algorithm
//
//  Created by Muker on 12/7/23.
//

import Foundation

struct Heap<T: Comparable> {
    /// Heap의 노드를 이루는 elements
    var elements: [T]
    /// 오름차순과 내림차순을 결정하는 클로저
    private let sort: (T,T) -> Bool
    
    init(elements: [T] = [], sort: @escaping (T, T) -> Bool) {
        self.elements = elements
        self.sort = sort
    }
    
    var isEmpty: Bool { return elements.isEmpty }
    var count: Int { return elements.count }
    
    mutating func insert(_ element: T) {
        elements.append(element)
        siftUp(from: elements.count - 1)
    }
    
    mutating func pop() -> T? {
        guard !isEmpty else { return nil }
        elements.swapAt(0, count - 1)
        let element = elements.removeLast()
        siftDown(from: 0)
        return element
    }
    
    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = parentIndex(of: child)
        
        while child > 0 && sort(elements[child],elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(of: child)
        }
    }
    
    private mutating func siftDown(from index: Int) {
        var parent = index
        
        while true {
            let leftChild = leftChildIndex(of: parent)
            let rightChild = rightChildIndex(of: parent)
            var candidate = parent
            
            if leftChild < count && sort(elements[leftChild], elements[candidate]) {
                candidate = leftChild
            }
            
            if rightChild < count && sort(elements[rightChild], elements[candidate]) {
                candidate = rightChild
            }
            
            if candidate == parent {
                return
            }
            
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
    
    private func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    private func leftChildIndex(of index: Int) -> Int {
        return index * 2 + 1
    }
    
    private func rightChildIndex(of index: Int) -> Int {
        return index * 2 + 2
    }
}
