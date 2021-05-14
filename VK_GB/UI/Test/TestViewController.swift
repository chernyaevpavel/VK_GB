//
//  TestViewController.swift
//  VK_GB
//
//  Created by Павел Черняев on 12.05.2021.
//

import UIKit

class TestViewController: UIViewController {

//    @IBOutlet weak var loadingIndicatorView: LoadIndicatorView!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        
//    }
//    @IBAction func start(_ sender: Any) {
//        loadingIndicatorView.startAnimation()
//    }
//    
//    @IBAction func stop(_ sender: Any) {
//        loadingIndicatorView.stopAnimation()
//    }
    
    @IBOutlet weak var searchControl: SearchBarControl!
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchControl.setupView()
    }
    
    @IBAction func btn1(_ sender: Any) {
        searchControl.startAnimation()
    }
}
