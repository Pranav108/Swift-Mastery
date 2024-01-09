import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

/****Priority inversion is where a low priority thread blocks a high priority thread.****/
/**USE SAMAPHORE ONLY IF THEIR USE MAKE SENSE**/

let semaphore = DispatchSemaphore(value: 1)

func printEmoji(for queue : DispatchQueue, with emoji : String) {
    queue.async {
        debugPrint("waiting for - \(emoji)")
        semaphore.wait()  
        
        for el in 0...10 {
            debugPrint("\(emoji) - \(el)")
        }
        debugPrint("signal completed for - \(emoji)")
        semaphore.signal()
    }
}

let lowerPriority = DispatchQueue.global(qos: .utility)
let heigherPriority = DispatchQueue.global(qos: .userInitiated)

printEmoji(for: lowerPriority, with: "🚙")
printEmoji(for: heigherPriority, with: "🚑")

//WE SHOLD NOT ASSIGN DIFFERENT pos TO TASK THAT WILL BE ACCESSED BY SAME SEMAPHORE
