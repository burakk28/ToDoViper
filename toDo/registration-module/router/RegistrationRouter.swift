//
//  RegistrationRouter.swift
//  toDo
//
//  Created by Burak Kara on 6.02.2023.
//

import Foundation

class RegistrationRouter : presenterToRouterRegistrationProtocol {
  
  static func createModule(ref: Registration) {
    ref.registrationPresenterObject = RegistrationPresenter()
    ref.registrationPresenterObject?.registrationInteractor = RegistrationInteractor()
  }
  
}
