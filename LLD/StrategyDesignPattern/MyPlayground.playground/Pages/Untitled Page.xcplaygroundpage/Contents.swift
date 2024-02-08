import Foundation

protocol Vehicle{
    func drive()
}

struct GoodsVehicle: Vehicle{
    func drive() {
        print("Drive with normal startegy")
    }
}

struct OffroadVehicle: Vehicle{
    func drive() {
        print("Drive with Sport startegy") // duplicate code
    }
}

struct SportsVehicle: Vehicle{
    func drive() {
        print("Drive with Sport startegy") // duplicate code
    }
}

var vehicles = [Vehicle]()

vehicles.append(GoodsVehicle())
vehicles.append(SportsVehicle())
vehicles.append(OffroadVehicle())
for el in vehicles{
    el.drive()
}
