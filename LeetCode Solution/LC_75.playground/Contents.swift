import Foundation

class Solution {
    func sortColors(_ nums: inout [Int]) {
        let length = nums.count
        var low = 0, mid = 0, high = length - 1
        while(mid <= high){
            if(nums[mid] == 2) {
                nums.swapAt(mid,high)
                high -= 1
            }else if(nums[mid] == 1) {
                mid += 1
            }else {
                nums.swapAt(low,mid)
                mid += 1
                low += 1
            }
        }
    }
}
