//
//  TestViewController.swift
//  VK_GB
//
//  Created by Павел Черняев on 12.05.2021.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var loadingIndicatorView: LoadIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    @IBAction func start(_ sender: Any) {
        loadingIndicatorView.startAnimation()
    }
    
    @IBAction func stop(_ sender: Any) {
        loadingIndicatorView.stopAnimation()
    }
}
