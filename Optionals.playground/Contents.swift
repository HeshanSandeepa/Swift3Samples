//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


var value : Int?
//print(value!)
print("Value is \(value)")


//avoid force un-wrapping safly
if let myValue = value {
    print(myValue)
}


// EX 01
class Car {
    var model : String?
}

var vehicle : Car?


vehicle = Car()
vehicle?.model = "Nissan"


if let veh = vehicle, let m = veh.model {
    print("All OK")
}


// EX 02
var cars : [Car]?
cars = [Car]()

cars?.append(Car())


// EX 03 - use initialize when  dont want to use optional or force un-wrapping

class Dog {
    var spec : String
    init(_spec : String) {
        self.spec = _spec
    }
}

var myDog = Dog(_spec: "White Stray")
print(myDog.spec)


if let carArr = cars, carArr.count > 0 {
    print(carArr.count)
}

// EX 04 - use force un-wrapping safly


class Person {
    var _age : Int!
    var age : Int {
        if _age == nil {
            _age = 15
        }
        return _age
    }
}

var p = Person()
print(p.age)



var a : Int! = 4
print(a)












