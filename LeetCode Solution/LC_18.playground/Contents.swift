import Foundation

class Solution {
    func fourSum(_ proidedArray: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        let n = proidedArray.count
        guard n >= 4 else { return [] }
        var nums = proidedArray.sorted(by: < )
        for i in 0...(n-4){
            if (i > 0 && nums[i] == nums[i - 1]) { continue }
            for j in (i+1)...(n-3){
                if (j > (i + 1) && nums [j] == nums[ j - 1]) { continue }
                var left = j + 1
                var right = n-1
                while(left < right){
                    if (left > (j + 1) && nums[left] == nums[left-1]) {
                        left += 1
                        continue
                    }
                    if (right < (n-1) && nums[right] == nums[right+1]) {
                        right -= 1
                        continue
                    }
                    let sum = nums[i] + nums[j] + nums[left] + nums[right]
                    let quadruplets = [nums[i] , nums[j] , nums[left] , nums[right]]
                    if( sum == target){
                        result.append(quadruplets)
                        left += 1
                        right -= 1
                    }else if (sum < target) {
                        left += 1
                    }else {
                        right -= 1
                    }
                }
            }
        }
        return result
    }
}
