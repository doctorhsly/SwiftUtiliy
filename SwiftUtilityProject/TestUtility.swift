//
//  TestUtility.swift
//  SwiftUtilityProject
//
//  Created by YangLu on 15/12/24.
//  Copyright © 2015年 TDENERGYs. All rights reserved.
//

import Foundation

class TestUtility {
  var name: String
  var age: Int
  
  init(name: String , age: Int) {
    self.name = name
    self.age = age
  }
  
  func description() {
    print("my name is \(name) , age is \(age)")
  }
  
}