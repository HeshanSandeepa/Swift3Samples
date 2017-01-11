
/** CLOSURES BASICS**/

//01. no paramters or no return type
var noParaOrReturn: () -> () = {
    print("No Paramertes or No return type")
}
//short version
var noParaOrReturn_ = {
    print("No Paramertes or No return type Short")
}
noParaOrReturn()
noParaOrReturn_()



//02. no parameters with return
var noParaWithReturn: () -> String = {
    return "No Parameter with Return"
}
//short version
var noParaWithReturn_ = {
    return "No Parameter with Return Short"
}
noParaWithReturn()
noParaWithReturn_()



//03. One paramters with Return
var oneParamterWithReturn: (String) -> String = { parameter -> String in
    return "parameter was " + parameter
}
//short
var oneParamterWithReturn_ = { (parameter: String) -> String in
    return "parameter was " + parameter + " Short"
}
oneParamterWithReturn("Heshan")
oneParamterWithReturn_("Heshan")



//04. One paramter without return
var oneParaWithOutReturn: (String) -> () = { parameter1 in
    print(parameter1)
}
//short
var oneParaWithOutReturn_ = { (parameter1: String) in
    print(parameter1)
}
oneParaWithOutReturn("One parameter with out Return")
oneParaWithOutReturn_("One parameter with out Return Short")


//05. Multiple parameters with out Return
var multipleParaWithOutReturn: (String, String) -> () = { paraOne, paraTwo in
    print(paraOne + paraTwo)
}
//short
var multipleParaWithOutReturn_ = { (paraOne: String, paraTwo: String) in
    print(paraOne + paraTwo)
}
multipleParaWithOutReturn("Swift 3 ", "Xcode")
multipleParaWithOutReturn_("Swift 3 Short", "Xcode Short")


//05. Multiple parameters with Return
var multipleParaWithReturn: (String, String) -> (String) = { paraOne, paraTwo -> String in
    return paraOne + paraTwo
}
//short
var multipleParaWithReturn_ = { (paraOne: String, paraTwo: String) -> String in
    return paraOne + paraTwo
}
multipleParaWithOutReturn("Swift 3 ", "Xcode 8")
multipleParaWithOutReturn_("Swift 3 Short", "Xcode 8 Short")


//06. One parameter with Multiple Return
var onePaameterWithMultipleReturn: (Int) -> (Int, String) = { parameter -> (Int, String) in
    return (parameter, "\(parameter)")
}
//short
var onePaameterWithMultipleReturn_ = { (parameters: Int) -> (Int, String) in
    return (parameters, "\(parameters)")
}
var returnTuple = onePaameterWithMultipleReturn(5)
returnTuple.0
returnTuple.1

var returnTuple_ = onePaameterWithMultipleReturn_(50)
returnTuple_.0
returnTuple_.1


/** SHORT HAND PARAMETER NAMES **/


var gameScores = [2, 58, 4568, 52, 7, 145]

//long version
func sortAsceding( i: Int, j: Int) -> Bool {
    return i > j
}
let scoreSortedLong = gameScores.sorted(by: sortAsceding)

//short version
let sortedShort = gameScores.sorted(by: {(i: Int, j: Int) -> Bool in
    return i > j
})

//even shorter with type inference
let sortedShort_ = gameScores.sorted(by: {i, j in i < j })
sortedShort_

//short hand argument names
let gameScoresShortArg = gameScores.sorted(by: {return $0 > $1})
gameScoresShortArg


/** CAPTURING VALUES **/

//global - anything can see what is there

var aNumber = 2
var multiplyBy2 = {
    aNumber = aNumber * 2
}

aNumber
multiplyBy2()
aNumber

//internal - nested function (Simplest form of a closure)
func makeDeduction(start: Int, step: Int) -> () -> Int {
    var total = start
    
    func subtracter() -> Int {
        total = total - step
        return total
    }
    
    return subtracter
}

var decrsaing = makeDeduction(start: 10, step: 2)
decrsaing()
decrsaing()

//ex 2
func increaseCellCount(forCount startCount: Int) -> () -> Int {
    var total = 0
    func growthTracker() -> Int {
        total = total + startCount
        return total
    }
    return growthTracker
}

let growBy100 = increaseCellCount(forCount: 100)
growBy100()
growBy100()

//closures are reference types
var double: (Int) -> (Int) = { x in
    return 2 * x
}

double(2)

var alsoDouble = double
alsoDouble(4)

/** TRAILING CLOSURES **/

//some function
func someFuncTakesClosure(someClosure: () -> Void) {
    //function body
}

//without a trailing closure
someFuncTakesClosure(someClosure: { /* closure body */})

//with a trailing closure
someFuncTakesClosure() { /*closure body*/ }

//Example 01
func some(begin: Int, end: Int, closureOn: (Int) -> Int) -> Int {
    var runningTotal = 0
    
    for i in begin...end {
        runningTotal += closureOn(i)
    }
    return runningTotal
}

var sumSqure = some(begin: 1, end: 5) { $0 * $0 }
sumSqure

//Example 02
var sumOfFirst10Numbers = some(begin: 1, end: 10) { $0 }
sumOfFirst10Numbers


/** HIGHER ORDER FUNCTIONS **/

//01
let name = ["Heshan", "Tommy", "Ned", "Robert"]
var sortedNamesAsc = name.sorted()
var sortedNameDsc = name.sorted() { $0 > $1}
sortedNameDsc

let digitName = [0: "Zero", 1: "One", 2: "Two"]
let numbers = [0, 1, 0]

let numberName = numbers.map() {(numbers) -> String in
    var outPut = ""
    outPut = digitName[numbers]! + outPut
    return outPut
}

numberName

//02
let scores = [1, 45, 25, 6358, 545585, 745]
let biggerScores = scores.filter { (score: Int) -> Bool in
    return score > 1000
}
biggerScores

//short
let biggerScores_ = scores.filter { $0 > 1000}
biggerScores_

//find all the sum of the all odd numbers from an array of numbers and then print it using map,
//reduce and filter

var numArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
var oddNumbers = numArray.filter { (num: Int) -> Bool in
    return num % 2 != 0
}

var mappedNumbers = oddNumbers.map { (num: Int) -> Int in
    return num * num
}

var reducedNumbers = mappedNumbers.reduce(0) { (i: Int, j: Int) -> Int in
    return i + j
}

//refactored
let sum = numArray
    .filter {(num: Int) -> Bool in return num % 2 != 0}
    .map{(num: Int) -> Int in return num * num}
    .reduce(0){(i: Int, j: Int) -> Int in return i + j
}

//further refactered using short and parameters

let shortHandSum = numArray.filter {return $0 % 2 != 0}.map{return $0 * $0 }.reduce(0){ return $0 + $1}
shortHandSum




















































