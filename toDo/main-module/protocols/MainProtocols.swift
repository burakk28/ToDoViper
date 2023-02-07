//
//  MainProtocols.swift
//  toDo
//
//  Created by Burak Kara on 6.02.2023.
//

import Foundation

protocol viewToPresenterMainProtocol {
  var mainInteractor:presenterToInteractorMainProtocol?{get set}
  var mainView:presenterToViewMainProtocol?{get set}

  func todoLoad()
  func search(searchWord:String)
  func delete(id:Int)
  
}
protocol presenterToInteractorMainProtocol{
  var mainPresenter:interactorToPresenterMainProtocol?{get set}
  
  func todoLoad()
  func search(searchWord:String)
  func delete(id:Int)
  
}

protocol interactorToPresenterMainProtocol {
  func presenterSendData(toDo:[ToDo])

  
}
protocol presenterToViewMainProtocol {
  
  func viewSendData(toDo:[ToDo])
}

protocol presenterToRouterMainProtocol {
  static func createModule(ref:ViewController)
}
