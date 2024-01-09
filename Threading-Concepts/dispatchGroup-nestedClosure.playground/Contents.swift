import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

class Example {
    private func makeApiCall(for str : String, for sec : Int, completion: @escaping()->Void){
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(sec)) { completion() }
    }
    
    func callWithDispatchGroup(){
        let startTime = Date()
        let dispatchGroup = DispatchGroup()
        var responses = Array<String>()
        
        dispatchGroup.enter()
        makeApiCall(for: "task 1", for: 4) {
            responses.append("response for : task1")
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        makeApiCall(for: "task 2", for: 5) {
            responses.append("response for : task2")
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        makeApiCall(for: "task 3", for: 2) {
            responses.append("response for : task3")
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            debugPrint("responses from callWithDispatchGroup: ")
            for el in responses { debugPrint(el) }
            debugPrint("execuation took : \(Date().timeIntervalSince(startTime))")
        }
    }
    
    func callWithNestedClosures(){
        let startTime = Date()
        debugPrint("responses from callWithNestedClosures: ")
        
        makeApiCall(for: "task A", for: 4) {
            debugPrint("response for : task A")
            
            self.makeApiCall(for: "task B", for: 5) {
                debugPrint("response for : task B")
                
                self.makeApiCall(for: "task C", for: 2) {
                    debugPrint("response for : task C")
                    debugPrint("execuation took : \(Date().timeIntervalSince(startTime))")
                }
            }
        }
    }
}

let example = Example()
example.callWithDispatchGroup()
example.callWithNestedClosures()

//"responses from callWithNestedClosures: "
//"response for : task A"
//"response for : task B"
//"response for : task C"
//"execuation took : 11.650182962417603"

//"responses from callWithDispatchGroup: "
//"response for : task3"
//"response for : task1"
//"response for : task2"
//"execuation took : 5.189482927322388"
