//
//  Detail.swift
//  toDo
//
//  Created by Burak Kara on 6.02.2023.
//

import UIKit

class Detail: UIViewController {

  @IBOutlet weak var titleTextField: UITextField!
  @IBOutlet weak var todoTextField: UITextField!
  
  var todo:ToDo?
  
  var detailPresenterObject : viewToPresenterDetailProtocol?
  

  override func viewDidLoad() {
        super.viewDidLoad()
    DetailRouter.createModule(ref: self)

    if let t = todo {
      todoTextField.text = t.todo
      titleTextField.text = t.title
    }
  }
  
  @IBAction func buttonUpdate(_ sender: Any) {
    
    if let tt = titleTextField.text , let to = todoTextField.text , let t = todo {
      detailPresenterObject?.update(id: t.id!, title: tt, todo: to)
    }
  }
  
}
