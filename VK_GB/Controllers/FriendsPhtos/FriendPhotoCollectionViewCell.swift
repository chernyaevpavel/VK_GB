//
//  FriendPhotoCollectionViewCell.swift
//  VK_GB
//
//  Created by Павел Черняев on 29.04.2021.
//

import UIKit

protocol ChangeStatusPhotoProtocol: AnyObject {
    func changeStatusPhoto(status: Bool)
}

class FriendPhotoCollectionViewCell: UICollectionViewCell, ChangeStatusPhotoProtocol {
        
    static let reuseID = "FriendPhotoCollectionViewCell"
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var likeControl: ILikeControl!
    weak var delegate: FriendsPhotoCollectionProtocol?
    var likePhoto: LikePhoto?
    
    override func prepareForReuse() {
        photo.image = nil
        likeControl.countLike = 0
        likeControl.isLike = false
    }
    
    func configure(likePhoto: LikePhoto) {
        self.likePhoto = likePhoto
        likeControl.countLike = likePhoto.like.countLike
        likeControl.isLike = likePhoto.like.isLike
        likeControl.delegate = self
        likeControl.drawControl()
        let image = UIImage(named: likePhoto.photo.name)
        if let tmpImage = image {
            photo.image = tmpImage
        } else {
            photo.image = UIImage(named: "no-image")
        }
    }
    
    func changeStatusPhoto(status: Bool) {
        delegate?.changeStatus(status: status, likePhoto: likePhoto)
    }
}
