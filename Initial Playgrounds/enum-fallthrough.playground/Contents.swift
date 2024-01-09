
enum Direction{
    case east,west,north,south
}

var dir = Direction.south

switch dir {
    
    case .east:
        print("east")
    case .west:
        print("west")
    case .north:
        print("north")
    case .south:
        print("south")
    default:
        print("defautl")
}



let grade1 = "A"

switch grade1 {
    case "A":
        print("Excellent!")
        fallthrough
    case "h":
        print("loreamipsum")
        fallthrough
    case "whqtever":
        print("Good!")
        
    case "C":
        print("Fair!")
        fallthrough
    default:
        print("Need Improvement")
}






var array = Array(repeating: 2.5, count: 5)
array

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}
let mars = Planet[4]
print(mars)

class Person{
    var name = "pranav"
    var val : Int?
}

var person = Person()
person
//Alternatively, you can override a superclass failable initializer with a subclass nonfailable initializer. This enables you to define a subclass for which initialization can’t fail, even though initialization of the superclass is allowed to fail.


//Note that if you override a failable superclass initializer with a nonfailable subclass initializer, the only way to delegate up to the superclass initializer is to force-unwrap the result of the failable superclass initializer.

//You can override a failable initializer with a nonfailable initializer but not the other way around.
enum LogLevel: String {
    case trace, debug, info, warn, error, fatal
}

func logFunc(_ message: String, level: LogLevel = .info) -> String {
    let logLine = "[\(level)] something: \(message)"
    print(logLine)
    return logLine
}

logFunc("Hello, world!")

class Employee{
    var ID : String
    var name : String
    var rm : String?
    
    init(empID : String, name : String){
        ID = empID
        self.name = name
    }
    func getInfo(){
        print("\(name)'s employeeID is \(ID)")
    }
}

class ProductManager : Employee {
    var propertiesOfProgramManager : String?
}

class SoftwareDeveloper : Employee {
    var propertiesOfSoftwareDeveloper : String?
}

var pm : Employee = ProductManager(empID: "someID1", name: "programManager")
var sd : Employee = SoftwareDeveloper(empID: "someID2", name: "developer")

pm
sd

let str = "5"
let num : Int = Int(str) ?? 8

let grade = "C"

switch grade {
    case "A":
        print("Excellent!")
        fallthrough
    case "h":
        print("loreamipsum")
        fallthrough
    case "whqtever":
        print("Good!")
        fallthrough
    case "C":
        print("Fair!")
        fallthrough
    default:
        print("Need Improvement")
}

func addition(num1 : Int,num2 : Int) ->Int {
    print("addition happeding")
    return num1 + num2
}

func parentFunc(){
    print("parntFunc")
    addition(num1: 4, num2: 7)
}

parentFunc()

var scores = ["Sophie": 5, "James": 2]
scores.updateValue(3, forKey: "James")
