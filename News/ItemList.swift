//
//  ItemList.swift
//  News
//
//  Created by Joseph Njogu on 10/05/2019.
//  Copyright © 2019 Joseph Njogu. All rights reserved.
//

import UIKit

class ItemList: UITableViewCell {
    
    
    @IBOutlet var picture: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var body: UILabel!
    @IBOutlet var author: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
