//
//  DetailProtocol.swift
//  toDo
//
//  Created by Burak Kara on 6.02.2023.
//

import Foundation

protocol presenterToInteractorDetailProtocol {
  
  func update(id:Int,title:String,todo:String)
  
}
protocol viewToPresenterDetailProtocol {
  var detailInteractor:presenterToInteractorDetailProtocol? {get set}
  
  func update(id:Int,title:String,todo:String)

  
}
protocol presenterToRouterDetailProtocol {
  static func createModule(ref:Detail)
}
