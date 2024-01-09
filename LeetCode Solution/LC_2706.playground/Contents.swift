import UIKit

class Solution {
    private func handleMinimum(for val : Int , in arr : inout [Int]){
        if (val <= arr[0]) {
            arr[1] = arr[0]
            arr[0] = val
        }else if(val < arr[1]){
            arr[1] = val
        }
    }
    func buyChoco(_ prices: [Int], _ money: Int) -> Int {
        
        var temp = [Int.max, Int.max]
        
        prices.forEach { el in
            handleMinimum(for: el, in: &temp)
        }
        let sum =  temp.reduce(0, +)
        
        if (sum <= money) { return money - sum }
        
        return money
        
    }
}
