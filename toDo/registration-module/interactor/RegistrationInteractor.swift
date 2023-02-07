//
//  RegistrationInteractor.swift
//  toDo
//
//  Created by Burak Kara on 6.02.2023.
//

import Foundation

class RegistrationInteractor : presenterToInteractorRegistrationProtocol {
  
    let db:FMDatabase?
    
    init(){
      let targetWay = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
      let databaseURL = URL(fileURLWithPath: targetWay).appendingPathComponent("todo.sqlite")
      db = FMDatabase(path: databaseURL.path)
    }
    
    
  func save(title: String, todo: String) {
    
    db?.open()
    
    do {
      try db!.executeUpdate("INSERT INTO todo (title,todo) VALUES (?,?)", values: [title,todo])
    }catch {
      print(error.localizedDescription)
    }
    
  
    db?.close()
    
  }
  
}
