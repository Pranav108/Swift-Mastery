import Foundation

enum TrafficColor {
    case red
    case green
    case blue
    case yellow
}

protocol ObserverProtocol {
    func onTrafficLightChange(to color : TrafficColor)
}

class VehicleObserver : ObserverProtocol{
    
    var vehicleName : String
    init(_ _vehicleName : String){
        self.vehicleName = _vehicleName
    }
    func onTrafficLightChange(to color : TrafficColor) {
        switch color {
        case .green:
            print("Drive the \(vehicleName)")
        case .red:
            print("Stop the \(vehicleName)")
        case .yellow:
            print("Start the \(vehicleName)")
        default:
            print("Invalid vehicle operation")
        }
    }
}

class VendorObserver : ObserverProtocol{
    var vendorType : String
    init(_ _vendorType : String) {
        self.vendorType = _vendorType
    }
    func onTrafficLightChange(to color : TrafficColor){
        switch color {
        case .green:
            print("\(vendorType) will stop selling")
        case .red:
            print("\(vendorType) will start sellling")
        case .yellow:
            print("\(vendorType) will ready sellling")
        default:
            print("Invalid vehicle operation")
        }
    }
}

class TrafficLightSubject {
    private var trafficVehicleObservers = [ObserverProtocol]()
    
    func addVehicleObserver(for _vechile : ObserverProtocol){
        trafficVehicleObservers.append(_vechile)
    }
    
    private var _color : TrafficColor = .red
    var trafficLightColor : TrafficColor {
        get {
            return _color
        }
        set {
            _color = newValue
            notifyObservers()
        }
    }
    
    private func notifyObservers(){
        trafficVehicleObservers.forEach({$0.onTrafficLightChange(to: _color)})
    }
    
    deinit {
        trafficVehicleObservers.removeAll()
    }
}

let car = VehicleObserver("Car")
let ballonMan = VendorObserver("Ballon")

let trafficLightSubject = TrafficLightSubject()
trafficLightSubject.addVehicleObserver(for: car)
trafficLightSubject.addVehicleObserver(for: ballonMan)

trafficLightSubject.trafficLightColor = .red
trafficLightSubject.trafficLightColor = .green
