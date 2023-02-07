//
//  ViewController.swift
//  toDo
//
//  Created by Burak Kara on 6.02.2023.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var toDoTableView: UITableView!
  
  var toDoList = [ToDo]()
  var mainPresenterObject:viewToPresenterMainProtocol?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    searchBar.delegate = self
    toDoTableView.delegate = self
    toDoTableView.dataSource = self
    
    databaseCopy()
    
    MainRouter.createModule(ref: self)
    
  }
  
  func databaseCopy(){
    let bundleWay = Bundle.main.path(forResource: "todo", ofType: ".sqlite")
    let targetWay = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    let copyWay = URL(fileURLWithPath: targetWay).appendingPathComponent("todo.sqlite")
    
    
    let fm = FileManager.default
    
    if fm.fileExists(atPath: copyWay.path) {
      print("Vt zaten var")
    }else {
      do{
        try fm.copyItem(atPath: bundleWay!, toPath: copyWay.path)
      }catch {
        print(error.localizedDescription)
      }
    }
  }
  
  
  override func viewWillAppear(_ animated: Bool) {
    mainPresenterObject?.todoLoad()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "toDetail" {
      if let to = sender as? ToDo {
        let toVc = segue.destination as! Detail
        toVc.todo = to
      }
    }
  }
  
}
extension ViewController : presenterToViewMainProtocol {
  func viewSendData(toDo: [ToDo]) {
    self.toDoList = toDo
    self.toDoTableView.reloadData()
    
  }
}

extension ViewController : UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    mainPresenterObject?.search(searchWord: searchText)
  }
}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return toDoList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell") as! TableViewCell
    
    
    let todo = toDoList[indexPath.row]
    
    cell.labelTitle.text = todo.title
    cell.labelToDo.text = todo.todo
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let todo = toDoList[indexPath.row]
    performSegue(withIdentifier: "toDetail", sender: todo)
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    
    
    let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction,view,bool) in
      
      let todo = self.toDoList[indexPath.row]
      
      let alert = UIAlertController(title: "Delete", message: "\(todo.title!) is delete", preferredStyle:.alert)
      
      let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
      alert.addAction(cancelAction)
      
      let yesAction = UIAlertAction(title: "Yes", style: .destructive){ action in
        self.mainPresenterObject?.delete(id: todo.id!)
    }
      alert.addAction(yesAction)
      
      self.present(alert,animated: true)
    }
    
    return UISwipeActionsConfiguration(actions: [deleteAction])
  }

  
}
