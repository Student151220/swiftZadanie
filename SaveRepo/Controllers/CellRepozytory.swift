//
//  CellRepozytory.swift
//  SaveRepo
//
//  Created by Damian Prokop on 07/11/2020.
//  Copyright © 2020 Damian Prokop. All rights reserved.
//

import UIKit

class CellRepozytory: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
