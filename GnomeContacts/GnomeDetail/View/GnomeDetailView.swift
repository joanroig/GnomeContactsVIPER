//
//  GnomeDetailView.swift
//  GnomeContacts
//
//  Created by Joan Roig on 5/3/18.
//  Copyright © 2018 Joan Roig. All rights reserved.
//

import UIKit
import Kingfisher

class GnomeDetailView: UIViewController {
    var presenter: GnomeDetailPresenterProtocol?
    
    @IBOutlet weak var gnomeImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var professionsLabel: UILabel!
    @IBOutlet weak var friendsLabel: UILabel!
    
    @IBOutlet weak var weightImage: UIImageView!
    @IBOutlet weak var heightImage: UIImageView!


    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var ageView: UIView!
    @IBOutlet weak var weightView: UIView!
    @IBOutlet weak var heightView: UIView!
    @IBOutlet weak var contentView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

}
extension GnomeDetailView: GnomeDetailViewProtocol{
    
    func showGnomeDetail(gnome: Gnome) {
        
        // Set texts
        nameLabel.text = determineGenre(name: gnome.name) + gnome.name
        ageLabel.text = "\(gnome.age) years"
        descriptionLabel.text = randomDescription(text: gnome.name, hairColor: gnome.hair_color.rawValue)
        heightLabel.text = String(gnome.height)
        weightLabel.text = String(gnome.weight)
        friendsLabel.text = gnome.friends.isEmpty ? "No friends :(" : gnome.friends.joined(separator: "\n")
        professionsLabel.text = gnome.professions.isEmpty ? "No professions :(" : gnome.professions.joined(separator: "\n")

        // Set default image and load the proper image with Kingfisher
        let image = UIImage(named: "user")
        gnomeImage.kf.setImage(with: gnome.thumbnail, placeholder: image)
        
        // Round views
        nameView.layer.cornerRadius = 8
        descriptionView.layer.cornerRadius = 18
        ageView.layer.cornerRadius = 18
        heightView.layer.cornerRadius = 18
        weightView.layer.cornerRadius = 18

        // Set view borders
        descriptionView.layer.borderWidth = 2
        descriptionView.layer.borderColor = UIColor.themeWhite.cgColor
        
        heightView.layer.borderWidth = 3
        heightView.layer.borderColor = UIColor.themeBlack.cgColor
        
        weightView.layer.borderWidth = 3
        weightView.layer.borderColor = UIColor.themeBlack.cgColor

        // Set view shadows
        descriptionLabel.shadow(.Heavy)
        heightLabel.shadow()
        weightLabel.shadow()
        heightImage.shadow(.Light)
        weightImage.shadow(.Light)
        
        // Set view colors
        descriptionView.backgroundColor = UIColor(patternImage: UIImage(named: "pattern1")!).withAlphaComponent(0.3)
        contentView.backgroundColor = getColorFromHairColor(hairColor: gnome.hair_color)
        
    }
}
