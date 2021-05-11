//
//  FriendPhotoCollectionViewCell.swift
//  VK_GB
//
//  Created by Павел Черняев on 29.04.2021.
//

import UIKit

class FriendPhotoCollectionViewCell: UICollectionViewCell, ChangeStatusLikeProtocol {
    static let reuseID = "FriendPhotoCollectionViewCell"
    @IBOutlet weak private var photo: UIImageView!
    @IBOutlet weak private var likeControl: ILikeControl!
    private var likePhoto: LikePhoto?
    weak var delegate: ChangeStatusLikeObjectProtocol?
    
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
    
    func changeStatusLike(status: Bool) {
        delegate?.changeStatus(status: status, obj: likePhoto)
    }
}
