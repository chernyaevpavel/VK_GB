//
//  FriendPhotosFullViewController.swift
//  VK_GB
//
//  Created by Павел Черняев on 07.05.2021.
//

import UIKit

class FriendPhotosFullViewController: UIViewController {
    var friendPhotos: [LikePhoto] = []
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
    }
    
    private func setupScrollView() {
        scrollView.contentSize.width = self.scrollView.frame.width * CGFloat(friendPhotos.count)
        scrollView.isPagingEnabled = true
        
        for (i, image) in friendPhotos.enumerated() {
            let view = ParallaxView()
            let scrollWidth = scrollView.frame.width
            let scrollHeight = scrollView.frame.height
            view.frame = CGRect(x:  scrollWidth * CGFloat(i), y: 0, width: scrollWidth, height: scrollHeight)
            view.imageView.image = UIImage(named: image.photo.name)
            scrollView.addSubview(view)
        }
    }
}
