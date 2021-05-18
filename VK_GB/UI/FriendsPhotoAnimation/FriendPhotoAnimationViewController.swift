//
//  FriendPhotoAnimationViewController.swift
//  VK_GB
//
//  Created by Павел Черняев on 14.05.2021.
//

import UIKit

class FriendPhotoAnimationViewController: UIViewController {
    var friendPhotos: [LikePhoto] = []
    var currentIndexPhoto: Int = 0
    @IBOutlet weak private var firstImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    private var leftSwipe: UIViewPropertyAnimator!
    private var rightSwipe: UIViewPropertyAnimator!
    
    @objc func onPan(_ recognizer: UIPanGestureRecognizer){
        let width: CGFloat = self.view.frame.width
        switch recognizer.state {
        case .began:
            prepareImageView()
            leftSwipe = UIViewPropertyAnimator(duration: 0.7,
                                               curve: .easeInOut,
                                               animations: {
                                                self.firstImageView.frame.origin.x -= width
                                                self.leftImageView.frame.origin.x -= width
                                                self.rightImageView.frame.origin.x -= width
                                               })
            leftSwipe.addCompletion {_ in
                self.complitionAnimation()
            }
            rightSwipe = UIViewPropertyAnimator(duration: 0.7,
                                                curve: .easeInOut,
                                                animations: {
                                                    self.firstImageView.frame.origin.x += width
                                                    self.leftImageView.frame.origin.x += width
                                                    self.rightImageView.frame.origin.x += width
                                                })
            rightSwipe.addCompletion {_ in
                self.complitionAnimation()
            }

            let animation = CABasicAnimation(keyPath: "transform.scale")
            animation.fromValue = 1
            animation.toValue = 0.9
            animation.duration = 0.1
            animation.fillMode = .forwards
            animation.isRemovedOnCompletion = false
            firstImageView.layer.add(animation, forKey: "transforScaleFirstImageView")
        case .changed:
            let translationX = recognizer.translation(in: self.view).x
            if translationX < 0 {
                if currentIndexPhoto == (friendPhotos.count - 1) { return }
                leftSwipe.fractionComplete = abs(translationX) / width
            } else {
                if currentIndexPhoto == 0 { return }
                rightSwipe.fractionComplete = abs(translationX) / width
            }
        case .ended:
            if leftSwipe.state.rawValue != 0 && rightSwipe.state.rawValue != 0 {
                leftSwipe.continueAnimation(withTimingParameters: nil, durationFactor: 0)
                rightSwipe.continueAnimation(withTimingParameters: nil, durationFactor: 0)
                return
            }
            if leftSwipe.state.rawValue != 0 {
                leftSwipe.continueAnimation(withTimingParameters: nil, durationFactor: 0)
                currentIndexPhoto += 1
                return
            }
            if rightSwipe.state.rawValue != 0 {
                rightSwipe.continueAnimation(withTimingParameters: nil, durationFactor: 0)
                currentIndexPhoto -= 1
                return
            }
            firstImageView.layer.removeAnimation(forKey: "transforScaleFirstImageView")
            leftImageView.isHidden = true
            rightImageView.isHidden = true
        default:
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstImageView.isUserInteractionEnabled = true
        let backgroundColorImageView = UIColor.black
        firstImageView.backgroundColor = backgroundColorImageView
        leftImageView.backgroundColor = backgroundColorImageView
        rightImageView.backgroundColor = backgroundColorImageView
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
        firstImageView.addGestureRecognizer(panGestureRecognizer)
        firstImageView.image = UIImage(named: friendPhotos[currentIndexPhoto].photo.name)
        leftImageView.isHidden = true
        rightImageView.isHidden = true
    }
    
    private func complitionAnimation() {
        let width: CGFloat = self.view.frame.width
        firstImageView.layer.removeAnimation(forKey: "transforScaleFirstImageView")
        firstImageView.image = UIImage(named: friendPhotos[currentIndexPhoto].photo.name)
        firstImageView.layer.frame.origin.x = 0
        leftImageView.layer.frame.origin.x = -width
        rightImageView.layer.frame.origin.x = width
        leftImageView.isHidden = true
        rightImageView.isHidden = true
    }
    private func prepareImageView() {
        firstImageView.image = UIImage(named: friendPhotos[currentIndexPhoto].photo.name)
        if currentIndexPhoto > 0 {
            leftImageView.image = UIImage(named: friendPhotos[currentIndexPhoto - 1].photo.name)
        }
        if (currentIndexPhoto + 1) < friendPhotos.count {
            rightImageView.image = UIImage(named: friendPhotos[currentIndexPhoto + 1].photo.name)
        }
        leftImageView.isHidden = false
        rightImageView.isHidden = false
        
    }
}

