import Foundation

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        let n = nums.count - 1
        for i in 0..<n {
            for j in 1...n {
                if (i != j && (nums[i] + nums[j]) == target) {
                    return [i,j]
                }
            }
        }
        return [-1, -1]
    }
}
