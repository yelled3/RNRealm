//
//  DataTest.swift
//  RNRealm
//
//  Created by Adam Farhi on 6/15/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

import Foundation
import RealmSwift

// Dog model
class Dog: Object {
  dynamic var name = ""
  dynamic var owner: Person? // Can be optional
}

// Person model
class Person: Object {
  dynamic var name = ""
  dynamic var birthdate = NSDate(timeIntervalSince1970: 1)
//  let dogs = List<Dog>()
}


@objc class DataTest {

  class func run() -> Void {
    
    // Get realm and table instances for this thread
    let realm = Realm()
    
    // Break up the writing blocks into smaller portions
    // by starting a new transaction
    for idx1 in 0..<1000 {
      realm.beginWrite()
      
      // Add row via dictionary. Property order is ignored.
      for idx2 in 0..<1000 {
        realm.create(Person.self, value: [
          "name": "\(idx1)",
          "birthdate": NSDate(timeIntervalSince1970: Double(idx2))
          ])
      }
      
      // Commit the write transaction
      // to make this data available to other threads
      realm.commitWrite()
    }
    
    

    var path = Realm.defaultPath
    
    
    NSLog(path)
  
  }
  
}
