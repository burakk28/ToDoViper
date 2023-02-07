//
//  MainInteractor.swift
//  toDo
//
//  Created by Burak Kara on 6.02.2023.
//

import Foundation


class MainInteractor : presenterToInteractorMainProtocol {
  var mainPresenter: interactorToPresenterMainProtocol?
  
  let db:FMDatabase?
  
  init(){
    let targetWay = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    let databaseURL = URL(fileURLWithPath: targetWay).appendingPathComponent("todo.sqlite")
    db = FMDatabase(path: databaseURL.path)
  }
  
  func todoLoad() {
    var list = [ToDo]()
    
    db?.open()
    
    do{
      let rs = try db!.executeQuery("SELECT * FROM todo", values: nil)
      
      while rs.next() {
        let id = Int(rs.string(forColumn: "id"))!
        let title = rs.string(forColumn: "title")!
        let todo = rs.string(forColumn: "todo")!
        
        let to = ToDo(id: id, title: title, todo: todo)
        list.append(to)
      }
      
      mainPresenter?.presenterSendData(toDo: list)
    }catch{
      print(error.localizedDescription)
    }
    
    db?.close()
  }
  
  func search(searchWord: String) {
    
    var list = [ToDo]()
    
    db?.open()
    
    do{
      let rs = try db!.executeQuery("SELECT * FROM todo WHERE title like ?", values: ["%\(searchWord)%"])
      
      while rs.next() {
        let id = Int(rs.string(forColumn: "id"))!
        let title = rs.string(forColumn: "title")!
        let todo = rs.string(forColumn: "todo")!
        
        let to = ToDo(id: id, title: title, todo: todo)
        list.append(to)
      }
      
      mainPresenter?.presenterSendData(toDo: list)
    }catch{
      print(error.localizedDescription)
    }
    
    db?.close()
  }

  func delete(id: Int) {
    db?.open()
    do{
        try db!.executeUpdate("DELETE FROM todo WHERE id = ?", values: [id])
      todoLoad()
    }catch{
        print(error.localizedDescription)
    }
    
    db?.close()
  }
  

}

