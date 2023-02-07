//
//  DetailInteractor.swift
//  toDo
//
//  Created by Burak Kara on 6.02.2023.
//

import Foundation

class DetailInteractor : presenterToInteractorDetailProtocol {

  let db:FMDatabase?
  
  init(){
    let targetWay = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    let databaseURL = URL(fileURLWithPath: targetWay).appendingPathComponent("todo.sqlite")
    db = FMDatabase(path: databaseURL.path)
  }
  
  func update(id: Int, title: String, todo: String) {

    db?.open()
    
    do{
      try db!.executeUpdate("UPDATE todo SET todo = ? , title = ? WHERE id = ?", values: [todo,title,id])
    }catch{
      print(error.localizedDescription)
    }
    
    db?.close()
  }
  
  
}
