
protocol Learner{
    func learnActivity()
    init()
}
extension Learner{
    func learnActivity(){
        print("I'm learning somethinhg")
    }
}


protocol Coder{
    func codingActivity()
}
extension Coder{
    func codingActivity(){
        print("I'm Coding somethinhg")
    }
}

class Student : Learner, Coder{

    var studentName : String
    init(_studentName : String){
        studentName = _studentName
    }
    
    required init() {
        print("Student initializer")
        // we should initialize the `studentName` here coz it is not optional so it must be initialized
        studentName = "_studentName"
    }
}

let me = Student(_studentName: "pranav")

me.codingActivity()
me.learnActivity()


