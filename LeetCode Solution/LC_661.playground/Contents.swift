import UIKit

// MARK: - INCOMPLETE

class Solution {
    func imageSmoother(_ img: [[Int]]) -> [[Int]] {
        
        guard !img.isEmpty else { return [[]] }
        let n = img.count, m = img[0].count
        
        if n == 1 && m == 1 { return img }
        
        var result = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
        
        
        if n == 1 {
            var prev = 0, sum = img[0][0] + img[0][1]
            result[0][0] = sum
            for i in stride(from: 1, to: m - 1, by: 1) {
                sum += img[0][i+1]
                sum -= img[0][prev]
                prev = i-1
                result[0][i] = sum
            }
            if m>2 {sum -= img[0][m-3]}
            result[0][m - 1] = sum
        }
        
        for i in 0..<n {
            for j in 0..<m{
                
            }
        }
        return [[]]
    }
}

