//
//  CellOfSearchResult.swift
//  SearchController
//
//  Created by PreahNeangToch on 1/26/17.
//  Copyright © 2017 Kan Chanproseth. All rights reserved.
//

import UIKit

class CellOfSearchResult: UITableViewCell {
    
    
    @IBOutlet weak var ImageViewOfDoc: UIImageView!
    @IBOutlet weak var imageOfDoc: UILabel!
    @IBOutlet weak var NameOfPublisher: UILabel!
    @IBOutlet weak var DateOfPublish: UILabel!
    @IBOutlet weak var TotalNumberOfView: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        ImageViewOfDoc.layer.cornerRadius = 3
        ImageViewOfDoc.layer.borderWidth = 1
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
