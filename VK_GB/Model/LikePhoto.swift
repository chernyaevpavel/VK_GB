//
//  LikePhoto.swift
//  VK_GB
//
//  Created by Павел Черняев on 03.05.2021.
//

class LikePhoto {
    var photo: Photo
    var countLike: Int
    var isLiked: Bool = false
    init(_ photo: Photo, _ countLike: Int) {
        self.photo = photo
        self.countLike = countLike
    }
    
    init(_ photoName: String, _ countLike: Int) {
        self.photo = Photo(photoName)
        self.countLike = countLike
    }
}
