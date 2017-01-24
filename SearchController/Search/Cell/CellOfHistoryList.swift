//
//  CellOfSearchList.swift
//  SearchController
//
//  Created by Kan Chanproseth on 1/20/17.
//  Copyright © 2017 Kan Chanproseth. All rights reserved.
//

import UIKit

class CellOfHistoryList: UITableViewCell {

    @IBOutlet weak var listLabel: UILabel!
    @IBOutlet weak var btnSetToSearch: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
