//
//  ViewController.swift
//  GrowthEffect
//
//  Created by Alex Frost on 11/27/20.
//

import UIKit

class ViewController: UIViewController {
    
    private let growthButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    private let growthDuration: Double = 2.0
    
    @objc func growLongPress(_ gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == UIGestureRecognizer.State.began {
            // Start Grow Animation
            let widthAnimation = CABasicAnimation(keyPath: "borderWidth")
            widthAnimation.fromValue = 0
            widthAnimation.toValue = 16
            widthAnimation.duration = growthDuration

            let bothAnimations = CAAnimationGroup()
            bothAnimations.duration = growthDuration
            bothAnimations.animations = [widthAnimation]
            bothAnimations.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)

            growthButton.layer.add(bothAnimations, forKey: "width")
        } else if gestureRecognizer.state == .ended {
            // End Grow Animation
            growthButton.layer.removeAllAnimations()
            growthButton.layer.borderWidth = 7.0
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        growthButton.backgroundColor = .systemPink
        view.addSubview(growthButton)
        growthButton.center = view.center
        growthButton.layer.cornerRadius = 24.0
        growthButton.layer.masksToBounds = true
        growthButton.layer.borderColor = UIColor.gray.cgColor
        
        let longPressGesture: UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(growLongPress(_:)))
        longPressGesture.minimumPressDuration = 0.2
        growthButton.addGestureRecognizer(longPressGesture)
    }
}

