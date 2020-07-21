//
//  AIOMemoTableViewCell.swift
//  All-In-One
//
//  Created by Albin Berisha on 7/19/20.
//  Copyright © 2020 Albin Berisha. All rights reserved.
//

import UIKit

class AIOMemoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var row: Int?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
