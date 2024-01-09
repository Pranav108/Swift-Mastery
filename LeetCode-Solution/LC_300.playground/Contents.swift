import Foundation

class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums.count }
        let len = nums.count
        var dp = [Int](repeating : 1, count : len)
        for (index, element) in nums.enumerated() {
            var currentLIS = 0
            for el in stride(from: index - 1 , through: 0, by: -1){
                if (nums[el] < element) {
                    currentLIS = max(currentLIS, dp[el])
                }
            }
            dp[index] = currentLIS + 1
        }
        return dp.max()!
    }
}
