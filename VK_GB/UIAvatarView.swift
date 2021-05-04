//
//  UIAvatarView.swift
//  VK_GB
//
//  Created by Павел Черняев on 01.05.2021.
//

import UIKit

class UIAvatarView: UIView {
    var avatarImage = UIImageView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let hight = layer.frame.height
        let width = layer.frame.width
        
        //вьюха, которая отбрасывает тень
        layer.cornerRadius = hight / 2
        layer.shadowColor = UIColor.systemGray.cgColor
        layer.shadowRadius = 2
        layer.shadowOffset = CGSize(width: 5, height: 2)
        layer.shadowOpacity = 2.0
        
        //добавим ImageView и скруглим ее
        addSubview(avatarImage)
        avatarImage.frame = CGRect(x: 0, y: 0, width: width, height: hight)
        avatarImage.layer.cornerRadius = hight / 2
        avatarImage.layer.masksToBounds = true
        
    }
}
