//
//  ViewController.swift
//  MobileApp
//
//  Created by Prabhu Saitu on 8/15/18.
//  Copyright © 2018 Prabhu Saitu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var containerViewTopConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateImageView()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
       
    }
    
    func animateImageView() {
        let images:[UIImage] = [
            UIImage(named: "001")!,
            UIImage(named: "002")!,
            UIImage(named: "003")!,
            UIImage(named: "004")!,
            UIImage(named: "005")!,
            UIImage(named: "006")!
        ]
        var image_index = 0
        self.imageView.image = images[image_index]
        image_index += 1
        Timer.scheduledTimer(withTimeInterval: 4, repeats: true, block: { (timer) in
            UIView.transition(with: self.imageView, duration: 1, options: .transitionCrossDissolve, animations: {
                self.imageView.image = images[image_index]
            }, completion: { (completed) in
                print("Completed transition..")
            })
            if image_index == 5 { image_index = 0 } else { image_index += 1 }
        })
    }
    
}

