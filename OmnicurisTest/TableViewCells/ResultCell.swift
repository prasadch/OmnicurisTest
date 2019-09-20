//
//  ResultCell.swift
//  OmnicurisTest
//
//  Created by Prasada Rao Chokkapu on 19/09/19.
//  Copyright © 2019 Prasad Ch. All rights reserved.
//

import UIKit

class ResultCell: UITableViewCell {
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var lblOption1: UILabel!
    @IBOutlet weak var lblOption2: UILabel!
    @IBOutlet weak var lblOption3: UILabel!
    @IBOutlet weak var lblOption4: UILabel!
    @IBOutlet weak var yourAnswer: UILabel!
    @IBOutlet weak var actualAnswer: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
