func createArray(string : String) -> [String]{
    let strArray = [string]
    return strArray
}

func universalCreateArray<Element>(element : Element) -> [Element] {
    let arrayList = [element]
    return arrayList
}

let arratListStr = createArray(string: "hello")
let arratList = universalCreateArray(element: "something")
let arratList2 = universalCreateArray(element: 7)
let arratList4 = universalCreateArray(element: 7.9)
let arratList5 = universalCreateArray(element: true)

let nums : [Int] = [2,76,4,7,3,5,23,76,4,8]
//let sortedNums : [Int] = nums.sorted()
let sortedNumsDesc : [Int] = nums.sorted(by: > )

let sortedNums : [Int] = nums.sorted{
    (a,b) -> Bool in
    return a%2 == 0
    //    a = nums[i+1]
    //    b = nums[i]
    //    if true then do some operation to make it false
}

print(nums)
print(sortedNums)

//let numsStr = nums.map(<#T##transform: (Int) throws -> T##(Int) throws -> T#>)
let numsStr1 = nums.map{String($0)}
let numsStr2 = nums.map{(a) -> String
    in
    return String(a)
}
print(numsStr1)
print(numsStr2)

//let filterdNums = nums.filter(<#T##isIncluded: (Int) throws -> Bool##(Int) throws -> Bool#>)
let filterdNums = nums.filter{$0 < 8}
print(filterdNums)

//let reducedNums = nums.reduce(<#T##initialResult: Result##Result#>, <#T##nextPartialResult: (Result, Int) throws -> Result##(Result, Int) throws -> Result##(_ partialResult: Result, Int) throws -> Result#>)
let reducedNums = nums.reduce("InitialString - "){
    (result, num) -> String in
    return result + String(num)
}
let anotherReducedArray = nums.reduce("Nums"){$0 + "_" + String($1)}

print(reducedNums)
print(anotherReducedArray)

func someFunction(val : Int) throws -> Int? {
    // this function may throw error
    let num = 9/val
    return num
}

var someVal = try someFunction(val: 8)

if let someVal2 = try! someFunction(val: 9){
    print(someVal2, "working fine")
}else{
    print("some error occured")
}

do{
   try someFunction(val : 9)// val = 0

}catch{
    // do somthing to handle errors
    print("some error occured")
}

let numbers = [[[[1, 2, 3, 4, 5],[2, 3, 7, 2, 9],[3, 2, 1]]]]

//let doubled = numbers.flatMap(<#T##transform: (Int) throws -> Sequence##(Int) throws -> Sequence#>)
//let doubled = numbers.flatMap{[$0,2 * $0, 3 * $0]}
let doubled = numbers.flatMap{[$0[0]]}
//let doubled2 = numbers.flatMap { number in
//    return [number, number * 2]
//}

print(doubled)
//print(doubled2) // Output: [1, 2, 2, 4, 3, 6, 4, 8, 5, 10]

