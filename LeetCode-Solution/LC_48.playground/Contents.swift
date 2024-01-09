import Foundation

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let matrixSize = matrix.count
        for layer in 0..<(matrixSize / 2) {
            for j in layer..<(matrixSize - 1 - layer){
                let temp = matrix[ matrixSize - 1 - j][layer]
                matrix[ matrixSize - 1 - j][layer] = matrix[matrixSize - 1 - layer][matrixSize - 1 - j]
                matrix[matrixSize - 1 - layer][matrixSize - 1 - j] = matrix[j][matrixSize - 1 - layer]
                matrix[j][matrixSize - 1 - layer] = matrix[layer][j]
                matrix[layer][j] = temp
            }
        }
    }
}
