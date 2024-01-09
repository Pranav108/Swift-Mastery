
func winnerOfGame(_ colors: String) -> Bool {
    var aliceCount : Int = 0
    var bobCount : Int = 0
    let arr : [Character] = Array(colors)
    let target : Int = arr.count - 1
    
    var prevChar : Character
    var currentChar : Character
    var nextChar : Character
//  0 1 2 3 4 5 6 7
//  A A A A B B B B
    for i in stride(from: 1, to: target, by: 1) {
        print("i = \(i), \(arr[i])")
        prevChar = arr[i-1]
        currentChar = arr[i]
        nextChar = arr[i+1]
        
        print(prevChar,currentChar,nextChar)
        
        if (currentChar == "A" && prevChar == "A" && nextChar == "A"){
            aliceCount += 1
        }
    
        if (currentChar == "B" && prevChar == "B" && nextChar == "B"){
            bobCount += 1
        }
        print("=================================")
    }
    return aliceCount > bobCount
}

print(winnerOfGame("AAAABBBB"))
