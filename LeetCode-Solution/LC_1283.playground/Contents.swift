import Foundation
class Solution {
    private func getSum(for nums: [Int], with divisor : Int) -> Int{
        var sum : Int = 0
        let res = nums.reduce(sum){ $0 + Int(ceil(Double($1) / Double(divisor)))}
        return res
    }
    func smallestDivisor(_ nums: [Int], _ threshold: Int) -> Int {
        guard nums.count <= threshold else { return -1 }
        
        let maxValue = nums.max()!
        
        var ans = -1
        var left = 1, right = maxValue
        
        while(left <= right){
            let mid = ( left + right ) / 2
            let res = getSum(for: nums, with: mid)
            
            if (res <= threshold) {
                ans = mid
                right = mid - 1
            }else{
                left = mid + 1
            }
        }
        return ans
    }
}
