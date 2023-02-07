//
//  DetailPresenter.swift
//  toDo
//
//  Created by Burak Kara on 6.02.2023.
//

import Foundation

class DetailPresenter : viewToPresenterDetailProtocol {
  var detailInteractor: presenterToInteractorDetailProtocol?
  
  func update(id: Int, title: String, todo: String) {
    detailInteractor?.update(id: id, title: title, todo: todo)
  }

  
}
