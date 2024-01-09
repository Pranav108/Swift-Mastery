import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

struct Example{
    func executeExample(){
        var number = 15
        
        let workItem = DispatchWorkItem {
            debugPrint("incrementing the number....")
            number += 5
        }
        
        let completionWorkItem = DispatchWorkItem {
            debugPrint("number after increment : \(number)")
        }
        
        workItem.notify(queue: .main, execute: completionWorkItem)
        
        let queue = DispatchQueue.global(qos: .utility)
        queue.async(execute: workItem)
        
    }
    func printNumbers(){
        var workItem : DispatchWorkItem?
        workItem = DispatchWorkItem {
            for i in 1..<10 {
                if let workItem = workItem, !workItem.isCancelled {
                    debugPrint(i)
                }else{
                    debugPrint("workItem is cancelled")
//                    break
                }
                sleep(1)
            }
        }
        
        workItem?.notify(queue: .main,execute: {
            // will always be called, even if completed by cancellation
            debugPrint("printing number completed")
        })
        
        let queue = DispatchQueue.global(qos: .utility)
        queue.async(execute: workItem!)
        
        queue.asyncAfter(deadline: .now() + .seconds(3)) {
            workItem?.cancel()
        }
       
    }
}

let example = Example()
//example.executeExample()

example.printNumbers()
