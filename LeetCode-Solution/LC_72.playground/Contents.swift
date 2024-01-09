import Foundation

class Recursive_Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        guard word1.count >= 0, word2.count >= 0 else { return 0 }
        return helper(for: word1, and: word2, having: word1.count - 1, and: word2.count - 1)
    }
    
    func helper(for str1 : String, and str2 : String, having i : Int, and j : Int) -> Int{
        guard i >= 0, j >= 0 else { return max(i,j) + 1 }
        let char1 = str1[str1.index(str1.startIndex, offsetBy: i)]
        let char2 = str2[str2.index(str2.startIndex, offsetBy: j)]
        
        if( char1 == char2 ) {
            return helper(for: str1, and: str2, having: i - 1 , and: j - 1)
        }
        return 1 + min ( helper(for: str1, and: str2, having: i , and: j - 1),  helper(for: str1, and: str2, having: i - 1 , and: j), helper(for: str1, and: str2, having: i - 1 , and: j - 1))
    }
}

class Memoization_Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let m = word1.count
        let n = word2.count
        
        guard m >= 0, n >= 0 else { return 0 }
        var dp = [[Int]](repeating: [Int](repeating: -1, count: n), count: m)
        helper(for: word1, and: word2, having: m - 1, and: n - 1, with: &dp)
        print(dp)
        return dp[m-1][n-1]
    }
    
    func helper(for str1 : String, and str2 : String, having i : Int, and j : Int, with dp : inout [[Int]]) -> Int {
        guard i >= 0, j >= 0 else { return max(i,j) + 1 }
        guard dp[i][j] == -1 else { return dp[i][j] }
        
        let char1 = str1[str1.index(str1.startIndex, offsetBy: i)]
        let char2 = str2[str2.index(str2.startIndex, offsetBy: j)]
        
        if( char1 == char2 ) {
            dp[i][j] = helper(for: str1, and: str2, having: i - 1 , and: j - 1, with: &dp)
        }else{
            dp[i][j] = 1 + min(helper(for: str1, and: str2, having: i , and: j - 1, with: &dp),  helper(for: str1, and: str2, having: i - 1 , and: j, with: &dp), helper(for: str1, and: str2, having: i - 1 , and: j - 1, with: &dp))
        }
        print(dp[i][j])
        return dp[i][j]
    }
}


class DP_Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let m = word1.count
        let n = word2.count
        
        guard m > 0, n > 0 else { return max(m,n) }
        var dp = [[Int]](repeating: [Int](repeating: -1, count: n + 1), count: m + 1)
        
        for el in 0...m { dp[el][0] = el }
        for el in 0...n { dp[0][el] = el }
        
        for (index1, char1) in word1.enumerated() {
            for (index2, char2) in word2.enumerated() {
                if (char1 == char2) {
                    dp[index1 + 1][index2 + 1] = dp[index1][index2]
                }else{
                    dp[index1 + 1][index2 + 1] = 1 + min(dp[index1][index2], dp[index1 + 1][index2], dp[index1][index2 + 1])
                }
            }
        }
        return dp[m][n]
    }
}

