import UIKit

class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        let n = matrix.count
        let m = matrix[0].count
        var horiz = [Int](repeating: 1, count: m)
        var vert = [Int](repeating: 1, count: n)
        
        for (i , arr) in matrix.enumerated() {
            for (j, el) in arr.enumerated(){
                if(el == 0) {
                    horiz[j] = 0
                    vert[i] = 0
                }
            }
        }
        
        for index in stride(from: 0, to: m, by: 1){
            if (horiz[index] == 0) {
                for i in stride(from: 0, to: n, by: 1){
                    matrix[i][index] = 0
                }
            }
        }
        
        for index in stride(from: 0, to: n, by: 1){
            if (vert[index] == 0) {
                for i in stride(from: 0, to: m, by: 1){
                    matrix[index][i] = 0
                }
            }
        }
    }
}
