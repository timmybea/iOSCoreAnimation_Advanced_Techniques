//
//  ViewController.swift
//  2.4_stretchy_views_contents_center
//
//  Created by Tim Beals on 2017-03-06.
//  Copyright © 2017 Tim Beals. All rights reserved.
//
//Note that you can also do this in storyboard by clicking on the view and the accessing the 'stretching' values.

import UIKit

class ViewController: UIViewController {

    
    
    
    let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 650, width: 200, height: 30))
        button.backgroundColor = UIColor.blue
        button.setTitle("animate", for: .normal)
        button.addTarget(self, action: #selector(animateStretchFrame), for: .touchUpInside)
        return button
    }()
    
    var stretchHeight: NSLayoutConstraint?
    
    let stretchView: StretchView = {
        let view = StretchView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
//        if let image = UIImage(named: "speech_bubble") {
//            stretchView.addStretchyImage(image, withContentsCenter: CGRect(x: 0.25, y: 0.25, width: 0.5, height: 0.5))
//        }
    }

    private func setupViews() {
        view.backgroundColor = UIColor.darkGray
        view.addSubview(stretchView)
        view.addSubview(button)
        
        stretchView.frame = CGRect(x: 30, y: 30, width: view.bounds.width - 60, height: 400)
    }
    
    
    func animateStretchFrame() {
    
        stretchView.animateBubbleChange()
    }
}

