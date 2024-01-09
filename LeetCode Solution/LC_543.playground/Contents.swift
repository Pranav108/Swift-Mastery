import Foundation

//Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
class Solution {
    private var res = 0
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        helper(for: root)
        return res
    }
    
    private func helper(for node : TreeNode?) -> Int {
        guard let node = node else { return 0 }
        let leftLength = helper(for: node.left)
        let rightLength = helper(for: node.right)
        res = max(res, 1 + leftLength + rightLength)
        return max(leftLength, rightLength)
    }
}
