//
//  todo.swift
//  toDo
//
//  Created by Burak Kara on 6.02.2023.
//

import Foundation

class ToDo{
  
  var id:Int?
  var title:String?
  var todo:String?
  
  init(id: Int, title: String, todo: String) {
    self.id = id
    self.title = title
    self.todo = todo
  }
  
}
