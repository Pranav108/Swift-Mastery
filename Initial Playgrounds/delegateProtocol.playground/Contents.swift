
// Define a delegate protocol
protocol MyButtonDelegate: AnyObject {
    func didTapButton(name:String)
}

protocol MyButtonDelegate2: AnyObject {
    func didTapButton2(name:String)
}

// Create a class with a delegate property
class MyButton {
    weak var delegate: MyButtonDelegate?
    
    func tap() {
        delegate?.didTapButton(name:"sachin")
    }
}

class MyButton2 {
    weak var delegate2: MyButtonDelegate2?
    
    func tap() {
        delegate2?.didTapButton2(name:"shubham")
    }
}

// Create a class that conforms to the delegate protocol
class ViewController: MyButtonDelegate, MyButtonDelegate2 {
    func didTapButton2(name: String) {
        print("Button tapped! 2   \(name)")
    }
    
    let button = MyButton()
    let button2 = MyButton2()
    
    init() {
        button.delegate = self
        button2.delegate2 = self
    }
    
    func didTapButton(name:String) {
        print("Button tapped!  \(name)")
    }
}

// Create an instance of ViewController
let viewController = ViewController()

// Simulate tapping the button
viewController.button.tap()
viewController.button2.tap()


//In the UITableViewDelegate some methods are define(only with their name). And in UITableView, it might have been asked to call some methods of UITableViewDelegate in ANY OF THE CLASS WHICH HAVE INHERITED THE DELEGATE_PROTOCOL [possibly ViewController] so now in ViewController an instance of UITableView will say that bro, I'm the class where you have to call those method [ by assigning instance.delegate = self], so that instance have accesss to all the methods of UITableViewDelegate and it will be called by UITableView.
