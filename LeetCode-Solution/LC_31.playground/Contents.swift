import UIKit

class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        let len = nums.count
        
        var currentIndex = len - 1
        for index in stride(from: len-2, through: 0, by: -1) {
            if (nums[index] < nums[index+1]) {
                currentIndex = index
                break
            }
        }
        if (currentIndex == (len - 1)){
            nums.sort()
            return
        }
        currentIndex += 1
        nums[currentIndex..<len].sort(by: < )
        for i in stride(from: currentIndex , to: len, by: 1){
            if(nums[i]>nums[currentIndex - 1 ]) {
                nums.swapAt(i, currentIndex - 1)
                break
            }
        }
        nums[currentIndex..<len].sort(by: < )
    }
}
