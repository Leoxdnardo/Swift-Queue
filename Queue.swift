//
//  Queue.swift
//
//  Created by Leonardo da Silva on 24/01/15.
//  Copyright (c) 2015 Leonardo da Silva. All rights reserved.
//

import Foundation

public struct Queue<T> {
	
	private var top: QueueNode<T>? = nil
	
	var count: Int {
		if var node = top {
			var c = 1
			while node.next != nil {
				node = node.next!
				c++
			}
			return c
		}
		
		return 0
	}

	mutating func enQueue(key: T) {
		if var node = top {
			while node.next != nil {
				node = node.next!
			}
			node.next = QueueNode(key: key)
		} else {
			top = QueueNode(key: key)
		}
	}
	
	mutating func deQueue() -> T? {
		let prevTop = top
		
		top = top?.next
		
		return prevTop?.key
	}
	
	func isEmpty() -> Bool {
		return top == nil
	}
	
	func peek() -> T? {
		return top?.key
	}
}

private class QueueNode<T> {
	var key: T
	var next: QueueNode? = nil
	
	init(key: T) {
		self.key = key
	}
}
