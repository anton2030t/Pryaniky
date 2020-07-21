//
//  PryanikCell.swift
//  Pryaniky
//
//  Created by Anton Larchenko on 20.07.2020.
//  Copyright © 2020 Anton Larchenko. All rights reserved.
//

import UIKit

class PryanikCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    static let identifier = "PryanikCell"

    override func prepareForReuse() {
        isHidden = false
        isSelected = false
        isHighlighted = false
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
