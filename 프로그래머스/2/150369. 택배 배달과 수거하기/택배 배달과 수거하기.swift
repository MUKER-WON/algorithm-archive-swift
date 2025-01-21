import Foundation

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    
    var deliveryValue = 0
    var pickupValue = 0
    var ans: Int64 = 0
    
    for i in (0..<n).reversed() {
        
        deliveryValue += deliveries[i]
        pickupValue += pickups[i]
        
        while deliveryValue > 0 || pickupValue > 0 {
            
            deliveryValue -= cap
            pickupValue -= cap
            ans += Int64((i+1)*2)
        }
    }
    
    return ans
}