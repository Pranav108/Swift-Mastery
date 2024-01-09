import Foundation

class Solution {
    func uniquePathsWithRecursion(_ m: Int, _ n: Int) -> Int {
        guard m > 0, n > 0 else { return 0 }
        if( m == 1 && n == 1 ) { return 1 }
        return uniquePathsWithRecursion(m - 1, n ) + uniquePathsWithRecursion(m, n - 1)
    }
    func uniquePathsWithMathematics(_ m: Int, _ n: Int) -> Int {
        guard m > 1, n > 1 else { return 1 }
        guard m >= n else { return uniquePathsWithMathematics (n, m) }
        var res = 1
        for i in 1..<n {
            res *= (m + i - 1)
            res /= i
        }
        
        return res
    }
}


