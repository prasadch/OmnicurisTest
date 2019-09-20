//
//  QuestionsCell.swift
//  OmnicurisTest
//
//  Created by Prasad Ch on 18/09/19.
//  Copyright © 2019 Prasad Ch. All rights reserved.
//

import UIKit

class OptionCell: UITableViewCell {

    @IBOutlet weak var optionLbl: UILabel!
    @IBOutlet weak var radioBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
