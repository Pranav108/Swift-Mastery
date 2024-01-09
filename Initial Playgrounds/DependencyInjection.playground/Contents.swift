import UIKit

// TIGHT COUPLING

//struct Order {
//    let amount : Double
//    let description : String
//    let tax : Double
//    let created_by : String
//}
//
// low level class
//class OrderDatabaseOperation {
//
//    // SOME PROPERTY AND METHOD RELATED TO DATABASE OPERATION
//
//    func saveOrder(order : Order){
//        // save order to databse
//        print("Order : \(order.description) of amount \(order.amount) is saved")
//    }
//}
//
// high-level class
//class Handler {
//    private let _orderDatabaseOperation : OrderDatabaseOperation
//
//    init(orderOperation : OrderDatabaseOperation) {
//        _orderDatabaseOperation = orderOperation
//    }
//
//    func saveOrder(order : Order) {
//        guard order.amount != 0 else{
//            print("Save operation FAILED, Order amount should be greather than 0")
//            return
//        }
//        _orderDatabaseOperation.saveOrder(order: order)
//    }
//}
//
//let objHandler = Handler(orderOperation: OrderDatabaseOperation())
//objHandler.saveOrder(order: Order(amount: 200, description: "ORDER_DESCRIPTION", tax: 8, created_by: "sinchan"))


/// ########################################################################################################
/// ########################################################################################################
//LOOSE COUPLING
struct Order {
    let amount : Double
    let description : String
    let tax : Double
    let created_by : String
}
// Abstraction
protocol OrderStorage {
    func saveOrder(order : Order)
}

// Low-level Module (or Class)
class OrderLocalOperation : OrderStorage{
    // SOME PROPERTY AND METHOD RELATED TO LOCAL DATABASE OPERATION
    func saveOrder(order : Order){
        print("Order : \(order.description) of amount \(order.amount) is saved using Local-Operation")
    }
}
class OrderAPIOperation : OrderStorage{
    // SOME PROPERTY AND METHOD RELATED TO API OPERATION
    func saveOrder(order : Order){
        print("Order : \(order.description) of amount \(order.amount) is saved using API-Operation")
    }
}

// High-level Module(or Class)
class Handler {
    private let _orderDatabaseOperation : OrderStorage

    init(storage : OrderStorage) {
        _orderDatabaseOperation = storage
    }

    func saveOrder(order : Order) {
        guard order.amount != 0 else{
            print("Save operation FAILED, Order amount should be greather than 0")
            return
        }
        _orderDatabaseOperation.saveOrder(order: order)
    }
}
let databaseStorage : OrderStorage = OrderLocalOperation()
let apiStorage : OrderStorage = OrderAPIOperation()

//let objHandler = Handler(storage: databaseStorage)
let objHandler = Handler(storage: apiStorage)
objHandler.saveOrder(order: Order(amount: 200, description: "ORDER_DESCRIPTION", tax: 8, created_by: "sinchan"))
