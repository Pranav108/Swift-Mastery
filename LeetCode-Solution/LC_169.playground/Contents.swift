import Foundation

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var count = 0, prev = nums[0]
        for el in nums {
            if (el == prev) {
                count += 1
            }else{
                count -= 1
            }
            if (count == 0){
                count = 1
                prev = el
            }
        }
        return prev // because majority must exists
    }
}
