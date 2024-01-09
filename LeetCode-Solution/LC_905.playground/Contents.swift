
class Solution {
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        var ans : [Int] = nums
        let length : Int = ans.count
        var ptr1 = 0, ptr2 = length - 1
        while ( ptr1 < ptr2 ){
            while (ptr1 < length && ans[ptr1]%2 == 0  ){ ptr1 += 1}
            while (ptr2 >= 0 && ans[ptr2]%2 == 1  ){ ptr2 -= 1}
            if (ptr1 == length || ptr2 < 0 || ptr1 >= ptr2) { break }
            ans.swapAt(ptr1, ptr2)
            ptr1 += 1
            ptr2 -= 1
        }
        return ans
    }
}

