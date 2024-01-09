import Foundation

class LinkedList {
    var val : Int
    var next : LinkedList?
    
    var nodeCount : Int {
        get {
            var currentNode : LinkedList? = self
            var elementCount = 0
            while(currentNode != nil){
                currentNode = currentNode?.next
                elementCount += 1
            }
            return elementCount
        }
    }
    
    var lastNode : LinkedList? {
        get {
            var currentNode : LinkedList? = self
            while(currentNode?.next != nil){
                currentNode = currentNode?.next     
            }
            return currentNode
        }
    }
    
    init(val: Int, next: LinkedList? = nil ) {
        self.val = val
        self.next = next
    }
    
    func addNodeInLastWith(value _val : Int) {
        var currentNode : LinkedList? = self
        while(currentNode?.next != nil){
            currentNode = currentNode?.next
        }
        currentNode?.next = LinkedList(val: _val)
    }
    
    func addNodeAtFrontWith(value _val : Int){
        // Actually swapping the value for first two node
        let newNode = LinkedList(val: self.val,next: self.next)
        self.val = _val
        self.next = newNode
    }
    
    func addNode(at index : Int , with _val : Int) -> LinkedList?{
        
        guard index > 0 else { 
            addNodeAtFrontWith(value: _val)
            return self
        }
        
        var currentIndex = 0
        var currPtr : LinkedList? = self
        var prevPtr : LinkedList?
        while(currPtr != nil && currentIndex < index) {
            currentIndex += 1
            prevPtr = currPtr
            currPtr = currPtr?.next
        }
        if (currentIndex == index) {
            prevPtr?.next = LinkedList(val: _val, next: currPtr)
            return prevPtr?.next
        }
        return nil
    }
    
    func contains(val _value: Int) -> Bool{
        var currentNode : LinkedList? = self
        while(currentNode != nil){
            if (currentNode?.val == _value) { return true }
            currentNode = currentNode?.next
        }
        return false
    }
    
    func sortLinkedList(){
        let length = self.nodeCount
        var dummyArr = [Int](repeating: 0, count: length)
        var currentNode : LinkedList? = self
        for el in 0..<length{
            dummyArr[el] = currentNode!.val
            currentNode = currentNode!.next
        }
        
        dummyArr.sort()
        currentNode = self
        for el in 0..<length{
            currentNode?.val = dummyArr[el]
            currentNode = currentNode!.next
        }
    }
    
    func printList(){
        let length = self.nodeCount
        var currentNode : LinkedList? = self
        print("Elements of LinkedList are : ",terminator: "")
        for _ in 0..<length{
            print("\(currentNode!.val), ", terminator: "")
            currentNode = currentNode!.next
        }
        print("\n====================\n")
    }
}

let list = LinkedList(val: 50)
list.addNodeInLastWith(value: 10)
list.addNodeInLastWith(value: 70)
list.addNodeInLastWith(value: 30)
list.addNodeAtFrontWith(value: 90)
list.addNodeAtFrontWith(value: 60)
list.printList()
list.sortLinkedList()
list.printList()

list.addNode(at: 3, with: 20)
list.printList()

print("number of element in List : \(list.nodeCount)")

print(list.contains(val: 67))
print(list.contains(val: 90))
print(list.contains(val: 10))
print(list.contains(val: 40))
let curr = list.addNode(at: 20, with: 100)
print("curr : \(String(describing: curr))")

print("number of element in List : \(list.nodeCount)")


let curr2 = list.addNode(at: 2, with: 100)
print("curr2 : \(String(describing: curr2?.val))")
print("curr3 : \(String(describing: curr2?.next?.val))")

list.printList()
print("number of element in List : \(list.nodeCount)")

print("Last node is : \(list.lastNode?.val)")
