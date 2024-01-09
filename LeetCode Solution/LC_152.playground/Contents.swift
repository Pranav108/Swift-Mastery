import Foundation

//MARK: - INCOMPLETE
class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        
        var negativeProduct = 0
        var positiveProduct = 0
        var result = 0
        for el in nums {
            if (el > 0 ){
                if( positiveProduct == 0 ){ positiveProduct = el }
                else { positiveProduct *= el }
                negativeProduct *= el
            }else if (el < 0 ){
                negativeProduct = min(positiveProduct * el, el)
                positiveProduct = max(0, negativeProduct * el)
            }else {
                positiveProduct = 0
                negativeProduct = 0
            }
            result = max(result, positiveProduct)
        }
        return result
        
    }
}
