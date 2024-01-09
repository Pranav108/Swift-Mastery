import UIKit

protocol Car {
    func makeSound()
    func startCar()
}

class Audi : Car{
    init(){
        print("Created an Audi")
    }
    func makeSound() {
        print("Honk Honk!!")
    }
    
    func startCar() {
        print("Starting Audi...")
    }
}

class Siaz : Car {
    init(){
        print("Created an Siaz")
    }
    func makeSound() {
        print("Bonk Bonk!!")
    }
    
    func startCar() {
        print("Starting Siaz")
    }
}

class Person{
    
    init(){
        print("Created an Person")
    }
    func driveCar(car : Car){
        car.startCar()
        car.makeSound()
    }
}
let audi = Audi()
audi.makeSound()
audi.startCar()

let siaz = Siaz()
siaz.makeSound()
siaz.startCar()


let person = Person()
person.driveCar(car: audi)
person.driveCar(car: siaz)
