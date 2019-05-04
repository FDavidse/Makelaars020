//
//  ListTableViewCell.swift
//  Makelaars020
//
//  Created by Filip Davidse on 03-05-19.
//  Copyright © 2019 Filip Davidse. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    static var identifier: String {
        return String(describing: ListTableViewCell.self)
    }
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var agentLabel: UILabel!
    @IBOutlet weak var numberOfHousesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
