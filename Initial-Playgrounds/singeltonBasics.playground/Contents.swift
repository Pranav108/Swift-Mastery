struct UserInfo {
    var firstName : String
    var lastName : String
}

var userInfo : UserInfo?

class Singleton{
    static let shared = Singleton()
    private init(){}
    
    func getUserInfo() -> UserInfo? {
        return userInfo
    }

    func updateUserInfoParam(updatedUserInfo : UserInfo) -> Void {
        // SET PASSES USERINFO TO THE UNIVERSAL USERINFO
        userInfo = updatedUserInfo
    }
}

class User{
    func getUser() -> UserInfo?{
        // A new instance of singelton is created and it's getUserInfo is returned
        return Singleton.shared.getUserInfo()
    }

    func updatedUserInfo() -> (){
        Singleton.shared.updateUserInfoParam(updatedUserInfo : UserInfo(firstName: "Pranav", lastName: "Singh"))
    }
}

let objUser = User()
objUser.updatedUserInfo()
objUser.getUser()


var sing1 = Singleton.shared
var sing2 = Singleton.shared
if sing1 === sing2 {
    print("same ", sing1)
}else{
    print("Not same ")
}

var sing3 = Singleton.shared
sing3.updateUserInfoParam(updatedUserInfo: UserInfo(firstName: "Pranav", lastName: "Singh"))

var sing4 = Singleton.shared
sing4.updateUserInfoParam(updatedUserInfo: UserInfo(firstName: "Pranab", lastName: "Singh"))

if sing3 === sing4 {
    print("same ", sing1)
}else{
    print("Not same ")
}


class MySingleton {
    static let shared = MySingleton()

    private init() {
        // Private initializer to prevent external instantiation
    }

    func doSomething() {
        print("Singleton is doing something")
    }
}

// Usage:
var mysing1 = MySingleton.shared // Output: Singleton is doing something
var mysing2 = MySingleton.shared // Output: Singleton is doing something
if mysing1 === mysing2 {
    print("SAME ", mysing1)
}else{
    print("NOT SAME")
}



class Demo {
    var name : String?
    init(){}
}

let demo1 = Demo()
demo1.name = "demo1"
let demo2 = Demo()
demo2.name = "demo2"

