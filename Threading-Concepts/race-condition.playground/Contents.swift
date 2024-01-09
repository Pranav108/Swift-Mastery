import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

enum WithDrawMethod : String {
    case ATM = "ATM"
    case netBanking = "NetBanking"
}

//WE CAN ALSO USE NSLock TO LOCK OR  UNLOCK THE CODE REGION ACCESS - BUT IT'S DOESN'T WORK WITH VALUES

let semaphore = DispatchSemaphore(value: 1)

struct Transaction {
    static private var bankBalance = 1000
    
    func withdraw(amountOf withDrawAmount: Int, with method : WithDrawMethod) {
        semaphore.wait()
        if withDrawAmount <= Transaction.bankBalance {
            debugPrint("\(method.rawValue) : Suffecient balance, transaction started...")
            Thread.sleep(forTimeInterval: Double.random(in: 3...7))
            
            Transaction.bankBalance -= withDrawAmount
            debugPrint("\(method.rawValue) : Amount of \(withDrawAmount) is withdrawn successfully")
            debugPrint("\(method.rawValue) : Current balance is \(Transaction.bankBalance)")
        } else {
            debugPrint("\(method.rawValue) : Insuffecient balance")
        }
        semaphore.signal()
    }
}

let queue = DispatchQueue(label: "WithDrawQueue",attributes: .concurrent)

queue.async {
    let atmInstance = Transaction()
    atmInstance.withdraw(amountOf: 600, with: .ATM)
}

queue.async {
    let netBankingInstance = Transaction()
    netBankingInstance.withdraw(amountOf: 700, with: .netBanking)
}


//***IF WE DIRECTLY WITHDRAW THE MONEY THEN IT WILL BE EXECUATED IN SYNC FAISHON**
//let atmInstance = Transaction()
//atmInstance.withdraw(amountOf: 600, with: .ATM)
//let netBankingInstance = Transaction()
//netBankingInstance.withdraw(amountOf: 700, with: .netBanking)
