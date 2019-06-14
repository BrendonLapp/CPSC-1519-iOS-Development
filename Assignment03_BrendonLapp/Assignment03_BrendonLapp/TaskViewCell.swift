//
//  TaskViewCell.swift
//  Assignment03_BrendonLapp
//
//  Created by Brendon M Lapp on 2019-03-22.
//  Copyright © 2019 Brendon M Lapp. All rights reserved.
//

import UIKit

class TaskViewCell: UITableViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var taskLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
