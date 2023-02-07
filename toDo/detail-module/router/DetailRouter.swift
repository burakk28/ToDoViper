//
//  DetailRouter.swift
//  toDo
//
//  Created by Burak Kara on 6.02.2023.
//

import Foundation

class DetailRouter : presenterToRouterDetailProtocol {
  
  static func createModule(ref: Detail) {
    ref.detailPresenterObject = DetailPresenter()
    ref.detailPresenterObject?.detailInteractor = DetailInteractor()
  }
  
  
  
  
  
  
}
