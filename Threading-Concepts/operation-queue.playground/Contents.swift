import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

class Example {
    func executeSomeTask() {
        let blockOperation = BlockOperation()
        
        blockOperation.addExecutionBlock {
             debugPrint("this is first execution block...")
        }
        blockOperation.addExecutionBlock {
             debugPrint("this is second execution block...")
        }
        blockOperation.addExecutionBlock {
             debugPrint("this is third execution block...")
        }
        
//        blockOperation.start()
        let anotherBlockOperation = BlockOperation {
            debugPrint("This is another blkock operation")
        }
        
        let operationQueue = OperationQueue()
        operationQueue.qualityOfService = .utility
//        operationQueue.addOperation(blockOperation)
//        operationQueue.addOperation(anotherBlockOperation)
        
        operationQueue.addOperations([blockOperation,anotherBlockOperation], waitUntilFinished: false)
    }
}

let example = Example()
example.executeSomeTask()
