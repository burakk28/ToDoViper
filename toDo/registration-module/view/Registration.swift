//
//  Registration.swift
//  toDo
//
//  Created by Burak Kara on 6.02.2023.
//

import UIKit

class Registration: UIViewController {

  @IBOutlet weak var titleTextField: UITextField!
  
  @IBOutlet weak var toDoTextField: UITextField!
  
  var registrationPresenterObject : viewToPresenterRegistrationProtocol?
  
  override func viewDidLoad() {
        super.viewDidLoad()

    RegistrationRouter.createModule(ref: self)
      }
    

  @IBAction func buttonSave(_ sender: Any) {
    
    if let tt = toDoTextField.text , let ti = titleTextField.text {
      registrationPresenterObject?.save(title: ti, todo: tt)
    }
  }
  
}
