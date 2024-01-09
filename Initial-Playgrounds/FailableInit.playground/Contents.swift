import UIKit

protocol Driver {
    var age : Int {get set}
    func driving()
}

class SumoDriver : Driver {
    var age: Int
    
    init?( _age : Int){
        if _age < 18 {
            print("SumoDriver's age must be grather then 18")
            return nil
        }
        age = _age
    }
    func driving() {
        print("driver is driving the sumo")
    }
}

class TruckDriver : Driver{
    var age: Int
    
    init?(_age : Int) {
        if _age < 24 {
            print("TruckDriver's age must be grather then 24")
            return nil
        }
        age = _age
    }
    func driving() {
        print("driver is driving the sumo")
    }
}

let sumoDriver = SumoDriver(_age: 10) // will be and optional Value
sumoDriver?.driving()

let truckDriver = TruckDriver(_age: 20)
truckDriver?.driving()
