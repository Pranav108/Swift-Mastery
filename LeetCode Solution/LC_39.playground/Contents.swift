import Foundation

class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        guard candidates.count > 0 else { return [] }
        var res = [[Int]]()
        var myArr = candidates
        helper(for: [], and: &myArr, index: 0, with: target, having: &res)
        return res
    }
    
    func helper(for arr : [Int], and nums : inout [Int], index currentIndex : Int, with sum : Int, having res : inout [[Int]]) {
        guard currentIndex < nums.count else { return }
        
        if (sum == 0) {
            res.append(arr)
             
        }
        helper(for: arr, and: &nums, index: currentIndex + 1, with: sum, having: &res)
        
        if(nums[currentIndex] <= sum) {
            var newArr = arr + [nums[currentIndex]]
            helper(for: newArr, and: &nums, index: currentIndex, with: sum - nums[currentIndex] , having: &res)
        }
    }
}
