import Foundation

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0}
        var maximumProfit = 0
        var buingPrice = prices.first!
        for el in prices {
            buingPrice = min(buingPrice, el)
            maximumProfit = max(maximumProfit, el - buingPrice)
        }
        return maximumProfit
    }
}
