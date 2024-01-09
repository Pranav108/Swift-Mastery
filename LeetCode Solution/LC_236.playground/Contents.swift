import Foundation

//Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}


class Solution {
    
    private var arr1 = [TreeNode]()
    private var arr2 = [TreeNode]()
    
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let p = p, let q = q else { return nil }
        
        
        let res1 = fillArr(for: root, with: p, having: &arr1)
        let res2 = fillArr(for: root, with: q, having: &arr2)
        
        guard res1, res2 else { return nil }
        
        let count = min(arr1.count, arr2.count)
        arr1.reverse()
        arr2.reverse()
        var ptr = 0
        if (ptr <= count && ptr > 0){
            return arr1[ptr - 1]
        }
        
        return nil
    }
    
    private func fillArr(for node : TreeNode?, with value : TreeNode?, having arr : inout [TreeNode]) -> Bool {
        guard let node = node else { return false }
        
        if (node === value) {
            arr.append(node)
            return true
        }
        
        var res : Bool = fillArr(for: node.left, with: value, having: &arr) ||  fillArr(for: node.right, with: value , having: &arr)
        
        if res {
            arr.append(node)
        }
        return res
    }
}
