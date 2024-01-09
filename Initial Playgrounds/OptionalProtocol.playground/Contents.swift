import UIKit

@objc protocol MyOptionalProtocol {
    @objc optional func optionalMethod()
    func someNonOptionalMethod()
}

class MyClass1: MyOptionalProtocol {
    func someNonOptionalMethod() {
        print("this is some non-optional method in MyClass1")
    }
}

class MyClass2: MyOptionalProtocol {
    func someNonOptionalMethod() {
        print("this is some non-optional method in MyClass2")
    }
    
    func optionalMethod() {
        print("this is some optional method in MyClass2")
    }
}

let obj1 = MyClass1()
obj1.someNonOptionalMethod()

let obj2 = MyClass2()

obj2.optionalMethod()
obj2.someNonOptionalMethod()
