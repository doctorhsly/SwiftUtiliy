//: Playground - noun: a place where people can play

import UIKit

//class Person {
//    var age = 34, name = "Colin"
//    
//    func growOlder() {
//        self.age++
//    }
//}
//
//func celebrateBirthday(cumpleañero: Person) {
//    print("Happ Birthday \(cumpleañero.name)")
//    cumpleañero.growOlder()
//}
//
//let person = Person()
//celebrateBirthday(person)
//print(person.age)


struct Person {
    var age = 34, name = "Colin"
    
    mutating func growOlder() {
        self.age++
    }
}

func celebrateBirthday(inout cumpleañero: Person) {
    print("Happ Birthday \(cumpleañero.name)")
    cumpleañero.growOlder()
}

var person = Person()
celebrateBirthday(&person)
print(person.age)













