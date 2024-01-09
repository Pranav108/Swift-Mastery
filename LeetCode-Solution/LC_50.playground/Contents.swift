import Foundation

class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        var result : Double = 1
        var powerCount : Int  = n
        var valueToPower : Double = x
        while(powerCount != 0) {
            if( (powerCount % 2) != 0) {
                if (powerCount < 0) {
                    result /= valueToPower
                }else{
                    result *= valueToPower
                }
            }
            valueToPower *= valueToPower
            powerCount /= 2
        }
        return result
    }
}
