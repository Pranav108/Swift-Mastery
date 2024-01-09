import UIKit

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
    func helper(_ root: TreeNode?, _ ans : inout Int ) -> (leftValue : Int , rightValue : Int){
        guard let root = root else { return (Int.max, Int.max)}
        let rootValue : Int = root.val
        if (root.left == nil) && (root.right == nil) { return (rootValue,rootValue) }
        
        var (leftTouple, rightTouple) = ((rootValue,rootValue),(rootValue,rootValue))
        
        if let left = root.left {
            leftTouple = helper(left, &ans)
            ans = min(ans, abs(rootValue - leftTouple.1))
        }
        if let right = root.right {
            rightTouple = helper(right, &ans)
            ans = min(ans, abs(rootValue - rightTouple.0))
        }
        return (leftTouple.0, rightTouple.1)
    }
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        var ans : Int = Int.max
        helper(root, &ans)
        return ans;
    }
}
