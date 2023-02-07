//
//  MainRouter.swift
//  toDo
//
//  Created by Burak Kara on 6.02.2023.
//

import Foundation

class MainRouter : presenterToRouterMainProtocol {
  
  static func createModule(ref: ViewController) {
    
    
    let presenter = MainPresenter()
    ref.mainPresenterObject = presenter

    ref.mainPresenterObject?.mainInteractor = MainInteractor()
    ref.mainPresenterObject?.mainView = ref
    ref.mainPresenterObject?.mainInteractor?.mainPresenter = presenter
    
  
    
  }
  
  
  
}
