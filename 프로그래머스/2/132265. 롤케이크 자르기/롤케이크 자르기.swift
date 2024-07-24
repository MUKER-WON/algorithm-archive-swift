func solution(_ topping:[Int]) -> Int {
  var set = Set<Int>()
  var (철수,동생) = ([Int](),[Int]())
  
  for i in 0..<topping.count-1 {
    set.insert(topping[i])
    철수.append(set.count)
  }
  
  set.removeAll()
  
  for i in (1..<topping.count).reversed() {
    set.insert(topping[i])
    동생.append(set.count)
  }
  
  동생.reverse()
  
  return (0..<topping.count-1).filter { 철수[$0] == 동생[$0] }.count
}