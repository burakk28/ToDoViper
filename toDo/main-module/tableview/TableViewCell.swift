//
//  TableViewCell.swift
//  toDo
//
//  Created by Burak Kara on 6.02.2023.
//

import UIKit

class TableViewCell: UITableViewCell {

  @IBOutlet weak var labelTitle: UILabel!
  @IBOutlet weak var labelToDo: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
