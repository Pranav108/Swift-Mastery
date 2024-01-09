class Solution {
    func reverseWords(_ s: String) -> String {
        return s.split(separator: " ").map { String($0.reversed()) }.joined(separator: " ")
    }
}
