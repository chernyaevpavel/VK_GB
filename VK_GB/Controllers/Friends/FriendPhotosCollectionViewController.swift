//
//  FriendPhotosCollectionViewController.swift
//  VK_GB
//
//  Created by Павел Черняев on 29.04.2021.
//

import UIKit

protocol FriendPhotosCollectionViewControllerDelegate: AnyObject {
    func changeIsLike(isLike: Bool, index: Int)
}

class FriendPhotosCollectionViewController: UICollectionViewController, FriendPhotosCollectionViewControllerDelegate  {
        
    var friendPhotos: [LikePhoto] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func changeIsLike(isLike: Bool, index: Int) {
        //print("sdsdislike \(isLike) \(index)")
        friendPhotos[index].isLiked = isLike
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friendPhotos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FriendPhotoCollectionViewCell.reuseID, for: indexPath) as! FriendPhotoCollectionViewCell
        
        let likePhoto = friendPhotos[indexPath.row]
        cell.configure(likePhoto: likePhoto, index: indexPath.row)
        cell.delegate = self
        return cell
    }
}
