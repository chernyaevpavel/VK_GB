//
//  UserGroupTableViewCell.swift
//  VK_GB
//
//  Created by Павел Черняев on 28.04.2021.
//

import UIKit

class UserGroupTableViewCell: UITableViewCell {
    static let reuseID = "GroupCell"
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupDescription: UILabel!
    @IBOutlet weak var groupImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(name: String, description: String, image: UIImage?) {
        groupName.text = name
        groupDescription.text = description
        if let tmpImage = image {
            groupImage.image = tmpImage
        } else {
            groupImage.image = UIImage(named: "no-image")
        }
        groupImage.layer.cornerRadius = groupImage.frame.size.width / 2
        groupImage.clipsToBounds = true
        
    }
}
