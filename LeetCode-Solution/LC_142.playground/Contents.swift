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
    private func hasCycle(_ head: ListNode?) -> Bool {
        guard head != nil , head?.next != nil else { return false }
        
        var slow = head
        var fast = head?.next
        while(fast != nil && fast?.next != nil ){
            if ( slow === fast ) { return true }
            slow = slow?.next
            fast = fast?.next?.next
        }
        return false
    }
    func detectCycle(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return nil }
        guard hasCycle(head) else { return nil }
        
        var slow = head
        var fast = head
        repeat {
            slow = slow?.next
            fast = fast?.next?.next
        }while( fast !== slow)
        
        slow = head
        while(slow !== fast) {
            slow = slow?.next
            fast = fast?.next
        }
        return slow
    }
}
