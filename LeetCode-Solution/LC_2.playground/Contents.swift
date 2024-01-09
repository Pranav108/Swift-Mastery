import Foundation

//Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard l1 != nil else { return l2 }
        guard l2 != nil else { return l1 }
        
        var ptr1 = l1
        var ptr2 = l2
        var carry = 0
        var head = ListNode()
        var prev = head
        while(ptr1 != nil && ptr2 != nil) {
            let sum = ptr1!.val + ptr2!.val + carry
            let newNode = ListNode(sum % 10)
            carry = sum / 10
            prev.next = newNode
            prev = newNode
            ptr1 = ptr1?.next
            ptr2 = ptr2?.next
        }
        while( ptr1 != nil){
            let sum = ptr1!.val + carry
            let newNode = ListNode(sum % 10)
            carry = sum / 10
            prev.next = newNode
            prev = newNode
            ptr1 = ptr1?.next
        }
        while( ptr2 != nil){
            let sum = ptr2!.val + carry
            let newNode = ListNode(sum % 10)
            carry = sum / 10
            prev.next = newNode
            prev = newNode
            ptr2 = ptr2?.next
        }
        if (carry > 0 ) {
            let newNode = ListNode(carry)
            prev.next = newNode
        }
        return head.next
    }
}
