import Foundation

protocol DriveStrategy {
    func drive()
}

struct NormalDriveStrategy: DriveStrategy{
    func drive() {
        print("Drive with Normal startegy")
    }
}
struct SportDriveStrategy: DriveStrategy{
    func drive() {
        print("Drive with Sport startegy")
    }
}

protocol Vehicle {
    var driveStrategy : DriveStrategy { get set}
    func drive()
}
extension Vehicle {
    func drive(){
        driveStrategy.drive()
    }
}
struct GoodsVehicle: Vehicle {
    var driveStrategy: DriveStrategy = NormalDriveStrategy()
}

struct SportsVehicle: Vehicle {
    var driveStrategy: DriveStrategy = SportDriveStrategy()
}

struct OffroadVehicle: Vehicle {
    var driveStrategy: DriveStrategy = SportDriveStrategy()
}

var vehicles = [Vehicle]()

// Using dependency injection to set drive strategies
let goodsVehicle = GoodsVehicle()
let sportsVehicle = SportsVehicle()
let offroadVehicle = OffroadVehicle()

vehicles.append(goodsVehicle)
vehicles.append(sportsVehicle)
vehicles.append(offroadVehicle)

for vehicle in vehicles {
    vehicle.drive()
}
