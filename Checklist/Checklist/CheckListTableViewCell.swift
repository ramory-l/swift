//
//  CheckListTableViewCell.swift
//  Checklist
//
//  Created by Roxane Amory on 15.11.2019.
//  Copyright © 2019 Roxane Amory. All rights reserved.
//

import UIKit

class CheckListTableViewCell: UITableViewCell {

    @IBOutlet weak var checkmarkLabel: UILabel!
    @IBOutlet weak var todoTextLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
