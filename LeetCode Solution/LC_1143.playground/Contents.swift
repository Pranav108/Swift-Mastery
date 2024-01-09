import Foundation


class Memoization_Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let m = text1.count
        let n = text2.count
        // assuming m is smaller
        var dp = [[Int]](repeating: [Int](repeating: -1, count: n), count: m)
         recursive(text1, text2, m - 1, n - 1, &dp)
        return dp[0][0]
    }
    
    func recursive(_ text1 : String, _ text2 : String, _ m : Int, _ n : Int, _ dp : inout [[Int]]) -> Int {
        guard m >= 0 , n >= 0 else  { return 0 }
        if (dp[m][n] != -1){ return dp[m][n]}
        let char1 = text1[text1.index(text1.startIndex, offsetBy: m)]
        let char2 = text2[text2.index(text2.startIndex, offsetBy: n)]
        if (char1 == char2) {
            dp[m][n] =  1 + recursive(text1, text2, m - 1, n - 1, &dp)
        }else{
            dp[m][n] = max(recursive(text1, text2, m - 1, n, &dp), recursive(text1, text2, m, n - 1, &dp))
        }
        return dp[m][n]
    }
}

class DP_Solution{
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let m = text1.count
        let n = text2.count
        guard m >= 0 , n >= 0 else { return 0 }
        
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
        
        for (i, char1) in text1.enumerated(){
            for (j, char2) in text2.enumerated(){
                if(char1 == char2){
                    dp[i+1][j+1] = dp[i][j] + 1
                }else{
                    dp[i+1][j+1] = max(dp[i+1][j], dp[i][j+1])
                }
            }
        }
        return dp[m][n]
    }
}
