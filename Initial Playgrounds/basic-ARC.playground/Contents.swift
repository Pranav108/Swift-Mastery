class Person {
    let name: String
    init(name: String) { self.name = name }
    weak var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var pranav: Person?
var unit4A: Apartment?

pranav = Person(name: "Pranav Singh")
unit4A = Apartment(unit: "4A")

pranav!.apartment = unit4A
unit4A!.tenant = pranav

unit4A = nil
pranav = nil


//for i in 0..<6  {
//    print(i)
//}
//
//let minutes = 20
//let minuteInterval = 5
//
//for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
//    // render the tick mark every 5 minutes (0, 5, 10, 15 ... 45, 50, 55)
//    print(tickMark)
//}

class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being - deinitialized") }
}
class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}

var pranavSingh: Customer?
pranavSingh = Customer(name: "Pranav Singh")
pranavSingh!.card = CreditCard(number: 1234_5678_9012_3456, customer: pranavSingh!)
pranavSingh = nil

enum Direction {
    case east
    case west(counterClockWise : Int,clockWise : Int)
    case north
    case south
    
}

let dir = Direction.west(counterClockWise: 7, clockWise: 8)

switch dir {
case .east:
    print(".east")
case .west(let f, let i):
    print(f,i)
    
case .north:
    print(".north")
case .south:
    print(".south")
}
print(type(of: ()))

class Player{
    var playerName : String?
    static var playerCount : Int = 0
    init(playerName : String){
        self.playerName = playerName
        Player.playerCount += 1
    }
    
    static func getPlayerCount(){
         print("we have \(playerCount) plyer(s)")
    }
    
}

class SpecificPlayer : Player {
    
    
    
//    override var playerName = "Pro\(playerName)"
//    var specificPlayer = "Pro\(playerName)"
    var specificPlayer: String?
    
//    var playerName : String?
    
    init(){
        super.init(playerName: "sinchan")
        self.playerName = "Pro\(playerName)"
    }
}

let player1 = Player(playerName: "sachin")
let player2 = Player(playerName: "pranav")

Player.getPlayerCount()


