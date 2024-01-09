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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard head != nil else { return nil }
        var count = 0
        var curr = head
        while(curr != nil){
            count += 1
            curr = curr?.next
        }
        curr = head
        
        guard count >= n else { return nil }
        
        guard count > n else {
            var newHeader = curr?.next
            curr = nil
            return newHeader
        }
        
        for _ in 1..<(count - n) {  curr = curr?.next  }
        
        var nodeToRemove = curr?.next
        curr?.next = nodeToRemove?.next
        nodeToRemove = nil
        return head
    }
}
