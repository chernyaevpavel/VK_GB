//
//  FriendPhotosCollectionViewController.swift
//  VK_GB
//
//  Created by Павел Черняев on 29.04.2021.
//

import UIKit


class FriendPhotosCollectionViewController: UICollectionViewController, ChangeStatusLikeObjectProtocol  {
    
    var friendPhotos: [LikePhoto] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friendPhotos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FriendPhotoCollectionViewCell.reuseID, for: indexPath) as! FriendPhotoCollectionViewCell
        let index = indexPath.row
        let likePhoto = friendPhotos[index]
        cell.configure(likePhoto: likePhoto)
        cell.delegate = self
        return cell
    }
    
//    func changeStatus(status: Bool, likePhoto: LikePhoto?) {
//        let item = friendPhotos.first(where: {$0.photo.name == likePhoto?.photo.name})
//        item?.like.isLike = status
//    }
    
    func changeStatus<T>(status: Bool, obj: T) {
        guard let likePhoto = obj as? LikePhoto else { return }
        let item = friendPhotos.first(where: {$0.photo.name == likePhoto.photo.name})
        item?.like.isLike = status
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ShowFullPhoto" else { return }
        guard let destination = segue.destination as? FriendPhotosFullViewController else { return }
//        let selIndex = collectionView.indexPathsForSelectedItems
        destination.friendPhotos = friendPhotos
    }
}
