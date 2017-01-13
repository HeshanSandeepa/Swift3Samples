//: Playground - noun: a place where people can play

import UIKit
import Foundation

//introduction
protocol FindAreale {
    var area: Double { get set}
}

struct Squre: FindAreale {
    var side: Double
    
    var area: Double {
        get {
            return side * side
        }
        set {
            side = sqrt(newValue)
        }
    }
}

var squreArea = Squre(side: 12)
squreArea.side
squreArea.area

squreArea.area = 16
squreArea.side


//protocal inheritance
protocol Mammalable {
    var isBreathing: Bool {get set}
    func roar()
}

protocol Humanable: Mammalable {
    var isWriting: Bool {get set}
    func chill()
}

struct Person: Humanable {
    var isBreathing: Bool = true
    var isWriting: Bool = true
    
    func roar() {
        print("Heloooooo")
    }
    
    func chill() {
        print("Chilling")

    }
}

//protocol extension
protocol Fightable {
    func start()
}

// this is an extension for above protocol
extension Fightable {
    func start() {
        print("Fighter started")
    }
    
    func ledKick() {
        print("This is leg kick")
    }
}

struct KungFuFighter: Fightable {

}

class KickBoxerFighter: Fightable {
    
}

var f1 = KungFuFighter()
f1.start()
f1.ledKick()

var f2 = KungFuFighter()
f2.start()
f2.ledKick()

//protocol as Type
var fighterArr: [Fightable] = [f1, f2]

for f in fighterArr {
    f.start()
}

//protocol as delegate

//Child - an object
//Mother - delegate (perform a task requested by object)

protocol Cookble {
    func makeFood()
}

struct Mother: Cookble {
    func makeFood() {
        print("Cooks food")
    }
}

var mom = Mother()

struct Child {
    var dele: Cookble?
}

var baby = Child()
baby.dele = mom

baby.dele?.makeFood()























