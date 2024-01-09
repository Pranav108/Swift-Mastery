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
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        guard head != nil , head?.next != nil, head?.next?.next != nil else { return head }
        
        var ptr1 = head
        var ptr2 = head
        var count = 1
        while(ptr2?.next != nil ) {
            ptr2 = ptr2?.next
            count += 1
        }
        var prev : ListNode?
        for position in 1...count {
            if (position % 2 == 0){
                prev?.next = ptr1?.next
                ptr2?.next = ptr1
                ptr2 = ptr2?.next
                ptr1 = ptr1?.next
            }else{
                prev = ptr1
                ptr1 = ptr1?.next
            }
        }
        ptr2?.next = nil
        return head
    }
}
