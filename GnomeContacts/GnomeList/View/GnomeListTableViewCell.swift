//
//  GnomeListTableViewCell.swift
//  GnomeContacts
//
//  Created by Joan Roig on 5/3/18.
//  Copyright © 2018 Joan Roig. All rights reserved.
//

import UIKit
import Kingfisher

class GnomeListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var gnomeImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hairColorLabel: UILabel!
    @IBOutlet weak var friendsCountLabel: UILabel!
    
    @IBOutlet weak var attributesView: UIView!

    func fill(data: Gnome){

        nameLabel.text = determineGenre(name: data.name) + data.name
        hairColorLabel.text = "\(data.hair_color.rawValue) hair"
        friendsCountLabel.text = String(data.friends.count)
        
        // Set default image and load the proper image with Kingfisher
        let image = UIImage(named: "user")
        gnomeImage.kf.setImage(with: data.thumbnail, placeholder: image)
        
        // Round views
        gnomeImage.layer.cornerRadius = gnomeImage.frame.height/2
        attributesView.layer.cornerRadius = 8
        
        // Set view shadows
        attributesView.glow()
        
        // Set view colors
        self.backgroundColor = getColorFromHairColor(hairColor: data.hair_color)
        
    }
}
