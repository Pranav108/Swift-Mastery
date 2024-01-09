import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

class Example {
    var workItemReference : DispatchWorkItem?
    
    func debouncing(){
        for el in 1..<10 {
            workItemReference?.cancel()
            
            let workItem = DispatchWorkItem {
                debugPrint("\(el) added in qeue")
                self.altualFunctionImplementation(with: String(el))
            }
            workItemReference = workItem
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: workItemReference!)
            
//            let sleepTime : TimeInterval = TimeInterval(Int.random(in: 1...5))
//            debugPrint("going to sleep for : \(sleepTime)")
//            Thread.sleep(forTimeInterval: sleepTime)
//            
            debugPrint("loop iterating for : \(el)")
        }
    }
    
    private func altualFunctionImplementation(with value : String){
        debugPrint("value execuated for : \(value)")
    }
}

let example = Example()
example.debouncing()
