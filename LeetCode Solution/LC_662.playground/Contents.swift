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
    
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard root != nil else { return 0 }
        var arr = Array<(Int,Int)>()
        
        helper(for: root?.left, with: -1, having: &arr, and: 1)
        helper(for: root?.right, with: 1, having: &arr, and: 1)
        
        var res = 1
        arr.forEach { tp in
            if (tp.0 != Int.min && tp.1 != Int.max){
                res = max(res, tp.1 - tp.0)
            }
            print(tp.0, tp.1)
        }
        return res
    }
    private func helper( for node : TreeNode?, with level : Int, having arr : inout [(Int,Int)], and height : Int){
        guard let node = node else { return  }
        
        var leftLevel : Int
        var rightLevel : Int
        if( level >= 0){
            if (height > arr.count){
                arr.append((Int.max,level))
            }
            arr[height - 1].1 = max(level,arr[height - 1].1)
            arr[height - 1].0 = min(level,arr[height - 1].0)
            
            leftLevel = 2 * level - 1
            rightLevel = 2 * level
        }else{
            if (height > arr.count){
                arr.append((level,Int.min))
            }
            arr[height - 1].1 = max(level,arr[height - 1].1)
            arr[height - 1].0 = min(level,arr[height - 1].0)
            
            leftLevel = 2 * level
            rightLevel = 2 * level + 1
        }
        
        helper(for: node.left, with: leftLevel, having: &arr, and: height + 1)
        helper(for: node.right, with: rightLevel, having: &arr, and: height + 1)
    }
}
