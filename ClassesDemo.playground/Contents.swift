//: Playground - noun: a place where people can play

class Person {
    
    //stored properties
    var name: String
    var age: Int
    
    //computed properties
    var fullName: String {
        return "\(name)   \(name)"
    }
    
    //initalizer
    init() {
        name = "Heshan"
        age = 29
    }
    
    //custom initalizer
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    //functions
    func getPerson() -> String {
        return "\(name) is \(age) years old."
    }
}

var myPerson = Person()
myPerson.age
myPerson.name
myPerson.fullName
myPerson.getPerson()

var otherPerson = Person(name: "Yommy", age: 5)
otherPerson.age
otherPerson.name
otherPerson.fullName
otherPerson.getPerson()

