import UIKit

class Solution {
    func minOperations(_ s: String) -> Int {
        var count1 = 0,count2 = 0
        
//        count1 == "01010101"
//        count2 == "10101010"
        
        
//        input = "0100"
        
        for (index, el) in s.enumerated() {
            if(index%2 == 0){
                if( el == "0") {
                    count1 += 1
                }else{
                    count2 += 1
                }
            }else{
                if( el == "1") {
                    count1 += 1
                }else{
                    count2 += 1
                }
            }
        }
        
        return min(count1, count2)
    }
}
