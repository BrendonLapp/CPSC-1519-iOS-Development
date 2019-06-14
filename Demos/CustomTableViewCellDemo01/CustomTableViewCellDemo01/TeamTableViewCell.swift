//
//  TeamTableViewCell.swift
//  CustomTableViewCellDemo01
//
//  Created by Brendon M Lapp on 2019-03-13.
//  Copyright © 2019 Brendon M Lapp. All rights reserved.
//

import UIKit

class TeamTableViewCell: UITableViewCell {

    @IBOutlet weak var GPLabel: UILabel!
    @IBOutlet weak var WLabel: UILabel!
    @IBOutlet weak var LLabel: UILabel!
    @IBOutlet weak var OTLLabel: UILabel!
    @IBOutlet weak var PTSLabel: UILabel!
    @IBOutlet weak var TeamNameLabel: UILabel!
    @IBOutlet weak var LogoImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
