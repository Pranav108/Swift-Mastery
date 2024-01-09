import Foundation

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var result = Int.min
        var prev = 0
        for el in nums{
            if(prev <= 0) {
                prev = el
            }else{
                prev += el
            }
            result = max(prev, result)
        }
        return result
    }
}
