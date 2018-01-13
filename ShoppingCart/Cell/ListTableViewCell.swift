//
//  ListTableViewCell.swift
//  ShoppingCart
//
//  Created by Romeo Enso on 13/01/2018.
//  Copyright © 2018 Romeo Enso. All rights reserved.
//

import UIKit
import SwipeCellKit

class ListTableViewCell: SwipeTableViewCell {

    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func customInit(text: String) {
        title.text = text
        
        self.title.textColor = UIColor.white
        self.backgroundColor = UIColor.darkGray
    }
    
}
