//: Playground - noun: a place where people can play

import UIKit



class Vehicle {
    var model: String
    
    init(model: String) {
        self.model = model
    }
}

var aVehicle = Vehicle(model: "Toyota")
var bVehicle = aVehicle
//both aVehicle and bVehicle refer to the same location (instance)
bVehicle.model = "Nissan"

aVehicle.model
bVehicle.model


struct Car {
    var name:String
    
    init(name: String) {
        self.name = name
    }
}

var aCar = Car(name: "Toyota")
var bCar = aCar
//aCar and bCar are two different locations (instances)
bCar.name = "Nissan"

aCar.name
bCar.name

		