//
//  NewsTableViewCell.swift
//  VK_GB
//
//  Created by Павел Черняев on 09.05.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell, ChangeStatusLikeProtocol {
    
    static let reuseID = "NewsTableViewCell"
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsLikeControl: ILikeControl!
    private var news: News?
    var delegate: ChangeStatusLikeObjectProtocol?
    
    override func prepareForReuse() {
        headerLabel.text = ""
        newsLikeControl.countLike = 0
        newsLikeControl.isLike = false
        newsImageView.image = nil
    }
    
    func configure(news: News) {
        self.news = news
        headerLabel.text = news.header
        if news.images.count != 0 {
            let photo = news.images[0]
            let nameImage = photo.name
            if let image = UIImage(named: nameImage) {
                newsImageView.image = image
            } else {
                newsImageView.image = UIImage(named: "no-image")!
            }
        } else {
            newsImageView.image = UIImage(named: "no-image")!
        }
        
        newsLikeControl.countLike = news.like.countLike
        newsLikeControl.isLike = news.like.isLike
        newsLikeControl.delegate = self
    }
    
    func changeStatusLike(status: Bool) {
        guard let tmpNews = news else { return  }
        delegate?.changeStatus(status: status, obj: tmpNews)
    }
    
}
