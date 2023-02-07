//
//  RegistrationProtocol.swift
//  toDo
//
//  Created by Burak Kara on 6.02.2023.
//

import Foundation

protocol viewToPresenterRegistrationProtocol {

  var registrationInteractor : presenterToInteractorRegistrationProtocol? {get set}
  
  func save(title:String,todo:String)

}

protocol presenterToInteractorRegistrationProtocol {
  func save(title:String,todo:String)
}
protocol presenterToRouterRegistrationProtocol {
  
  static func createModule(ref:Registration)
}
