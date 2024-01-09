import Foundation


//Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Iterative_Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard head != nil , head?.next != nil else { return head }
        var prev : ListNode?
        var ptr = head
        while(ptr != nil ){
            var temp = ptr?.next
            ptr?.next = prev
            prev = ptr
            ptr = temp
        }
        return prev
    }
}
