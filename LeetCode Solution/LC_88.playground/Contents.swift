import UIKit

//nums1 = [1,2,3,0,0,0], m = 3
//nums2 = [2,5,6], n = 3
//Output: [1,2,2,3,5,6]

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var ptr1 = m - 1
        var ptr2 = m + n - 1
        while(ptr1>=0){
            nums1[ptr2] = nums1[ptr1]
            ptr1 -= 1
            ptr2 -= 1
        }
        ptr1 = n
        ptr2 = 0
        var currentIndex = 0
        while(ptr2 < n && ptr1 < (m+n)) {
            if(nums1[ptr1] <= nums2[ptr2]) {
                nums1[currentIndex] = nums1[ptr1]
                ptr1 += 1
            }else{
                nums1[currentIndex] = nums2[ptr2]
                ptr2 += 1
            }
            currentIndex += 1
        }
        
        while( ptr2 < n ){
            nums1[currentIndex] = nums2[ptr2]
            ptr2 += 1
            currentIndex += 1
        }
         while( ptr1 < ( m + n ) ){
            nums1[currentIndex] = nums1[ptr1]
            ptr1 += 1
            currentIndex += 1
        }
    }
}
