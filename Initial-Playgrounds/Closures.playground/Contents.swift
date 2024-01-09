
func loadPicture(of marks: Int?, completion: () -> Void, onFailure: () -> Void) {
    if let result = marks {
        completion()
    } else {
        onFailure()
    }
}

loadPicture(of: <#T##Int?#>, completion: <#T##() -> Void#>, onFailure: <#T##() -> Void#>)

loadPicture(of: nil) {
    print("Success")
} onFailure: {
    print("Couldn't download the next picture.")
}

