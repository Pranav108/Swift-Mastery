import Foundation

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let n = s.count
        guard n > 1 else { return n }
        var dict = [Character : Int]()
        var result = 0, left = 0
        for (index, char) in s.enumerated(){
            if let foundIndex = dict[char] {
                left = max(foundIndex + 1, left)
            }
            dict[char] = index
            result = max(result, index - left + 1)
        }
        return result
    }
}
