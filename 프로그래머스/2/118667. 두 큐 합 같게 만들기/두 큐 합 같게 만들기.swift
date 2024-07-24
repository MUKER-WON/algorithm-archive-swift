class Queue {
  private var new: [Int] = []
  private var old: [Int]
  var queue: [Int] { old.reversed()+new }
  
  init(_ input: [Int] ) { old = input.reversed() }
  
  func add(_ n: Int) {
    new.append(n)
  }
  
  func removeFirst() -> Int {
    guard !old.isEmpty || !new.isEmpty else { return 0 }
    if old.isEmpty {
      old = new.reversed()
      new.removeAll()
    }
    return old.removeLast()
  }
  
}

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
  var q1 = Queue(queue1)
  var q2 = Queue(queue2)
  var sum1 = queue1.reduce(0,+)
  var sum2 = queue2.reduce(0,+)
  let goal = (sum1+sum2)/2
  var count = 0
  var result = -1
  
  while count < queue1.count*3 {
    if sum1 == sum2 { result = count; break }
    if sum1 > sum2 {
      let n = q1.removeFirst()
      if n == 0 { break }
      q2.add(n)
      sum2 += n
      sum1 -= n
    } else {
      let n = q2.removeFirst()
      if n == 0 { break }
      q1.add(n)
      sum1 += n
      sum2 -= n
    }
    count += 1
  }
  return result
}