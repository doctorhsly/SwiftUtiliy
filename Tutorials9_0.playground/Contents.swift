//: Playground - noun: a place where people can play

import UIKit

struct Patron {
    let name: String
}
var own : Patron = Patron(name: "YangLu")
struct Beer {
    var percentRemaining = -100
    var isEmpty: Bool {
        return percentRemaining <= 0
    }
    var owner: Patron?
    
    mutating func sip() {
        guard percentRemaining > 0 else { // 1
            print("Your beer is empty, order another!")
            return
        }
        
        percentRemaining -= 10
        print("Mmmm \(percentRemaining)% left")
    }
}

var jamJarBeer = Beer()
jamJarBeer.owner = Patron(name: "YangLu");
repeat {
    jamJarBeer.sip()
} while (!jamJarBeer.isEmpty)


struct Bartender {
    func offerAnotherToOwnerOfBeer(beer: Beer) {
        guard let owner = beer.owner else {
            print("Egads, another wounded soldier to attend to.")
            return
        }
        
        print("\(owner.name), would you care for another?") // 1
    }
}

let bartender = Bartender()
bartender.offerAnotherToOwnerOfBeer(jamJarBeer)


typealias OperationType = (Double) -> Double
func doMath(operation: OperationType) -> Double {
    return 10;
}

func generateRandomNumber() -> Double {
    return Double(random())
}
generateRandomNumber()

func padString(string: String , length: Int) -> String {
    return ""
}

typealias Void = ()
func logDouble(number: Double) -> () {
    print(String(format: "%.2f", number))
}
logDouble(10)

func mean(numbers: Double ...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total /  Double(numbers.count)
}
mean(101,10,10,20)


func square(inout number: Double) {
    number = number * number
}

var a = 10.2
square(&a)
print(a)




