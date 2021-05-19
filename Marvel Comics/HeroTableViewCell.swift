//
//  HeroTableViewCell.swift
//  Marvel Comics
//
//  Created by Cassia Franco on 19/05/21.
//  Copyright © 2021 Yasmin Oliveira. All rights reserved.
//

import Foundation
import kingfisher

class HeroTableViewCell: UITableViewCell{
    
    @IBOutlet weak var ivThumb: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func prepareCell(with hero: Hero) {
        lbName.text = hero.name
        lbDescription.text = hero.description
    }
    
}
