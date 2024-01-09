import Foundation

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        if (numRows == 1) { return [[1]] }
        var result = [[1]]
        
        for i in stride(from: 1, to: numRows, by: 1) {
            var temp = [1]
            for j in stride(from: 1, to: i, by: 1){
                temp.append(result[i-1][j-1] + result[i-1][j])
            }
            temp.append(1)
            result.append(temp)
        }
        return result
    }
}
