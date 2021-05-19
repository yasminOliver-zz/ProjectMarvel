//
//  HeroTableViewCell.swift
//  Marvel Comics
//
//  Created by user191958 on 5/19/21.
//  Copyright © 2021 Everton Dias. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class HeroTableViewCell: UITableViewCell{
    
    @IBOutlet weak var ivThumb: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func prepareCell(with hero:Hero){
        lbName.text = hero.name
        lbDescription.text = hero.description
        if let url = URL(string: hero.thumbnail.url) {
            ivThumb.kf.indicatorType = .activity
            ivThumb.kf.setImage(with: url)
        } else{
            ivThumb.image = nil
        }
    }
    
}