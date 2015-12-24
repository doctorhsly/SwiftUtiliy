//: Playground - noun: a place where people can play

import UIKit

class Vehicle {
    
    var brandName = "null"
    var modelName = "null"
    var modelYear    = 0
    var powerSource = "null"
    var numberOfWheels = 0
    
    func goForward() -> String {
        return "null"
    }
    
    func goBackward() -> String {
        return "null"
    }
    
    func stopMoving() -> String {
        return "null"
    }
    
    func makeNoise() -> String {
        return "null"
    }
    
    func turn(degrees: Int) -> String {
        var normalizedDegrees = degrees
        
        let degreesInACircle = 360
        
        if (normalizedDegrees > degreesInACircle || normalizedDegrees < -degreesInACircle) {
            normalizedDegrees = normalizedDegrees % degreesInACircle
        }
        
        return String(format: "Turn %d degrees.", normalizedDegrees)
    }
    
    
    func changeGears(newGearName: String) -> String {
        return String(format: "Put %@ into %@ gea.", self.modelName , newGearName)
    }
    
}


var vehicle = Vehicle()
var changeGearResult = vehicle.changeGears("Test")
print("Vehicle make noise: \(vehicle.makeNoise())")


class Car : Vehicle {
    
    var isConvertible: Bool = false
    var isHatchback: Bool  = false
    var hasSunroof:   Bool  = false
    var numberOfDoors: Int = 0
    
    override init() {
        super.init()
        
        numberOfWheels = 4
    }
    
    // MARK: Private method implementations
    private func start() -> String {
        return String(format: "Start power source %@", powerSource)
    }
    
    override func goForward() -> String {
        return String(format: "%@ %@ Then depress gas pedal." , start() , changeGears("Forward"))
    }
    
}







