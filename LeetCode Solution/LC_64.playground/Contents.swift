import Foundation

class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        let m = grid.count
        
        guard m > 0 else { return 0}
        let n = grid[0].count
        
        var dp = grid
        for i in stride(from: 1, to: n, by: 1){ dp[0][i] += dp[0][i - 1]}
        for i in stride(from: 1, to: m, by: 1){ dp[i][0] += dp[i - 1][0]}
        
        for i in stride(from: 1, to: m, by: 1){
            for j in stride(from: 1, to: n, by: 1) {
                dp[i][j] += min(dp[i - 1][j],dp[i][j - 1])
            }
        }
        return dp[m - 1][n - 1]
    }
}
