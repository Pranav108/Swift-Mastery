import Foundation

class Recursive_Solution {
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        return helper(amount,0, coins)
    }
    func helper( _ sum : Int, _ curr : Int, _ arr : [Int]) -> Int {
        guard curr < arr.count else { return 0}
        guard sum != 0  else { return 1 }
        var res = helper(sum, curr + 1, arr)
        if (arr[curr] <= sum) {
            res += helper(sum - arr[curr], curr , arr)
        }
        return res
    }
}
// MARK: - HAVE TO IMPLEMENT DP VERSION
