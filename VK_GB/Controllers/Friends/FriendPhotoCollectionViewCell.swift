//
//  FriendPhotoCollectionViewCell.swift
//  VK_GB
//
//  Created by Павел Черняев on 29.04.2021.
//

import UIKit

protocol FriendPhotoCollectionViewCellDelegate: AnyObject {
    func changeIsLike(isLike: Bool)
}

class FriendPhotoCollectionViewCell: UICollectionViewCell, FriendPhotoCollectionViewCellDelegate {
    static let reuseID = "FriendPhotoCollectionViewCell"
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var likeControl: ILikeControl!
    weak var delegate: FriendPhotosCollectionViewControllerDelegate?
    var indexArr: Int?
    
    func changeIsLike(isLike: Bool) {
        //print(isLike)
        if let index = indexArr {
            delegate?.changeIsLike(isLike: isLike, index: index)
        }
    }
    
    func configure(likePhoto: LikePhoto, index: Int) {
        //print("cL=\(likePhoto.countLike) isL=\(likePhoto.isLiked)")
        self.indexArr = index
        likeControl.likeCount = likePhoto.countLike
        likeControl.heartState = likePhoto.isLiked
        likeControl.delegate = self
        likeControl.drawControl()
        let image = UIImage(named: likePhoto.photo.name)
        if let tmpImage = image {
            photo.image = tmpImage
        } else {
            photo.image = UIImage(named: "no-image")
        }
    }
}
