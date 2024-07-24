func solution(_ players:[String], _ callings:[String]) -> [String] {
  var arr = players
  var dic = Dictionary(uniqueKeysWithValues: zip(players,(0..<players.count)))
  for calling in callings {
    let index = dic[calling]!
    let front = arr[index-1]
    arr.swapAt(index,index-1)
    dic[front] = index
    dic[calling] = index-1
  }
  return arr
}