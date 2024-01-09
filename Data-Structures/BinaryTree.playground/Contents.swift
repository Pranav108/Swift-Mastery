import Foundation

class Tree{
    var val : Int
    var left : Tree?
    var right : Tree?
    
    init(val: Int, left: Tree? = nil, right: Tree? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
    
    func printRecursiveInorderTraversal(for node : Tree?){
        guard node != nil else { return }
        printRecursiveInorderTraversal(for: node?.left)
        print(node!.val , terminator: ", ")
        printRecursiveInorderTraversal(for: node?.right)
    }
    
    func printRecursivePreorderTraversal(for node : Tree?){
        guard node != nil else { return }
        print(node!.val , terminator: ", ")
        printRecursivePreorderTraversal(for: node?.left)
        printRecursivePreorderTraversal(for: node?.right)
    }
    
    func printRecursivePostorderTraversal(for node : Tree?){
        guard node != nil else { return }
        printRecursivePostorderTraversal(for: node?.left)
        printRecursivePostorderTraversal(for: node?.right)
        print(node!.val , terminator: ", ")
    }
    
    func leverOrderTraversal(){
        var queue = [self]
        print("\nElemnts of Tree in LevelOrder-Traversal : ")
        while(!queue.isEmpty){
            let len = queue.count
            for _ in 1...len {
                let el : Tree = queue.removeFirst()
                print(el.val, terminator: ", ")
                if (el.left != nil ) { queue.append(el.left!) }
                if (el.right != nil ) { queue.append(el.right!) }
            }
        }
    }
    
    func printIterativePreorderTraversal(){
        var stack : [Tree] = [self]
        print("\nElemnts of Tree in PreOrder-Traversal : ")
        while(!stack.isEmpty){
            let element = stack.removeLast()
            print(element.val, terminator: ", ")
            if element.right != nil {  stack.append(element.right!) }
            if element.left != nil {  stack.append(element.left!) }
        }
        print("\n======================================")
    }
    
    func printIterativeInorderTraversal(){
        var stack = [Tree]()
        var curr : Tree? = self
        print("\nElemnts of Tree in Inorder-Traversal : ")
        while(curr != nil || !stack.isEmpty){
            
            while(curr != nil ){
                stack.append(curr!)
                curr = curr?.left
            }
            curr = stack.removeLast()
            print(curr!.val, terminator: ", ")
            curr = curr?.right
        }
        print("\n======================================")
    }
    
    func heightOfTree(for node : Tree?) -> Int{
        guard node != nil else { return 0 }
        return 1 + max(heightOfTree(for: node?.left), heightOfTree(for: node?.right))
    }
    
    func printIterativePostorderTraversal(){
        // ABOUT TO BE IMPLEMENTED
    }
}

let tree = Tree(val: 10,left: Tree(val: 20,left: Tree(val: 40,left: Tree(val: 70),right: Tree(val: 80)),right: Tree(val: 50)),right: Tree(val: 30,left: Tree(val: 60)))

print("Elemnts of Tree in RecursivePreorder : ",terminator: "")
tree.printRecursivePreorderTraversal(for: tree) 

print("\nElemnts of Tree in RecursivePostorder : ",terminator: "")
tree.printRecursivePostorderTraversal(for: tree)

print("\nElemnts of Tree in RecursiveInorder : ",terminator: "")
tree.printRecursiveInorderTraversal(for: tree)

tree.printIterativeInorderTraversal()

tree.printIterativePreorderTraversal()

tree.leverOrderTraversal()

print("Height of tree is : \(tree.heightOfTree(for: tree))")
