//
//  RegistrationPresenter.swift
//  toDo
//
//  Created by Burak Kara on 6.02.2023.
//

import Foundation


class RegistrationPresenter : viewToPresenterRegistrationProtocol {
  var registrationInteractor: presenterToInteractorRegistrationProtocol?
  
  func save(title: String, todo: String) {
    registrationInteractor?.save(title: title, todo: todo)
  }
  
  
  
  
  
  
}
