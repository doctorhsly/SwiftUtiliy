//
//  Vehicle.swift
//  SwiftUtilityProject
//
//  Created by apple on 15/12/15.
//  Copyright © 2015年 TDENERGYs. All rights reserved.
//

import Foundation

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

