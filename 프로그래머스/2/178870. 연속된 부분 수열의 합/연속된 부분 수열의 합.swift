func solution(_ sequence:[Int], _ k:Int) -> [Int] {
  var (left,right) = (0,0)
  var num = sequence[0]
  var count = 1
  var min = [0,10000000]
  while true {
    if num == k && count < (min[1]-min[0]+1) {
      min = [left,right]
    }
    if num < k {
      right += 1
      count += 1
      if right == sequence.count { break }
      num += sequence[right]
      continue
    }
    num -= sequence[left]
    left += 1
    if left == sequence.count { break }
    count -= 1
  }
    return min
}