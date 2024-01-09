import Foundation

class Solution {
    func searchElementIn(array arr : [Int], for target : Int) -> Bool {
        
        var left = 0, right = arr.count - 1
        while(left < right ){
            let mid = left - (left - right)/2
            if(arr[mid] == target) {return true}
                
            if (arr[mid] > target) {
                left = mid + 1
            }else{
                right = mid - 1
            }
        }
        return false
    }
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        for el in matrix {
            if (el.first! <= target || target <= el.last!){
                return searchElementIn(array: el, for: target)
            }
        }
        return false
    }
}
