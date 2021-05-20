//
//  FriendPhotoCollectionViewCell.swift
//  VK_GB
//
//  Created by Павел Черняев on 29.04.2021.
//

import UIKit

class FriendPhotoCollectionViewCell: UICollectionViewCell {
    static let reuseID = "FriendPhotoCollectionViewCell"
    @IBOutlet weak var photo: UIImageView!
    
    
    func configure(photo: UIImage?) {
        if let tmpImage = photo {
            self.photo.image = tmpImage
        } else {
            self.photo.image = UIImage(named: "no-image")
        }
    }
}
