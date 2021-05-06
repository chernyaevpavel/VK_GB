//
//  FrindViewCell.swift
//  VK_GB
//
//  Created by Павел Черняев on 29.04.2021.
//

import UIKit

class FriendViewCell: UITableViewCell {
    static let reuseID = "FrindCell"
    
    @IBOutlet weak var avatar: UIAvatarView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var status: UILabel!
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(name: String, avatar: UIImage?, status: Status) {
        self.name.text = name
        self.status.text = status.rawValue
        switch status {
        case .onLine:
            self.status.textColor = UIColor(named: "colorDarkGreen")
        case .offLine:
            self.status.textColor = .red
        }
        if let tmpImage = avatar {
            self.avatar.avatarImage.image = tmpImage
        } else {
            
            self.avatar.avatarImage.image = UIImage(named: "no-image")
        }
    }

}
