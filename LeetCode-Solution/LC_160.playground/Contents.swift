import Foundation

//Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        guard headA != nil, headB != nil else { return nil }
        var ptr1 = headA
        var ptr2 = headB
        if ( ptr1 === ptr2 ){  return ptr1  }
        while(ptr1 != nil && ptr2 != nil ){
            ptr1 = ptr1?.next
            ptr2 = ptr2?.next
            if ( ptr1 === ptr2 ){  return ptr1  }
            if (ptr1 == nil ) { ptr1 = headB }
            if (ptr2 == nil ) { ptr2 = headA }
        }
        return nil
    }
}
