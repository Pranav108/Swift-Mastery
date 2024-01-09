import Foundation

class Solution {
    func merge(_ interval: [[Int]]) -> [[Int]] {
        let len = interval.count
        guard len > 1 else { return interval }
        var nums = interval
        nums.sort { $0[0] < $1[0] }
        var first = nums[0][0], second = nums[0][1]
        var result = [[Int]]()
        for el in nums{
            if (el[0] <= second) {
                second = max(second, el[1])
            }else{
                result.append([first,second])
                first = el[0]
                second = el[1]
            }
        }
        result.append([first,second])
        return result
    }
}
