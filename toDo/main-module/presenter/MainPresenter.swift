//
//  MainPresenter.swift
//  toDo
//
//  Created by Burak Kara on 6.02.2023.
//

import Foundation

class MainPresenter : viewToPresenterMainProtocol {
  var mainInteractor: presenterToInteractorMainProtocol?
  var mainView: presenterToViewMainProtocol?
  
  func todoLoad() {
    mainInteractor?.todoLoad()
  }
  
  func search(searchWord: String) {
    mainInteractor?.search(searchWord: searchWord)
  }
  
  func delete(id: Int) {
    mainInteractor?.delete(id: id)
  }
}
extension MainPresenter : interactorToPresenterMainProtocol {
  func presenterSendData(toDo: [ToDo]) {
    mainView?.viewSendData(toDo: toDo)

  }
  func viewSendData(toDo: [ToDo]) {
    mainView?.viewSendData(toDo: toDo)
  }
  
  
}
