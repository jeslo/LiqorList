//
//  LiqorViewCell.swift
//  LiqorReuse
//
//  Created by Joe on 04/06/20.
//  Copyright © 2020 jess. All rights reserved.
//

import UIKit

class LiqorViewCell: UITableViewCell {
    @IBOutlet weak var LiqorViewCell: UIView!
    @IBOutlet weak var liqorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
