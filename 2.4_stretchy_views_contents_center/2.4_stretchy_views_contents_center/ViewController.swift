//
//  ViewController.swift
//  2.4_stretchy_views_contents_center
//
//  Created by Tim Beals on 2017-03-06.
//  Copyright © 2017 Tim Beals. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let buttonWide: UIView = {
        let view = UIView()
        //view.backgroundColor = UIColor.red
        return view
    }()
    
    let buttonTall: UIView = {
        let view = UIView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        if let image = UIImage(named: "button") {
            
            addStretchyImage(image, withContentsCenter: CGRect(x: 0.25, y: 0.25, width: 0.5, height: 0.5), toView: buttonWide)
            addStretchyImage(image, withContentsCenter: CGRect(x: 0.25, y: 0.25, width: 0.5, height: 0.5), toView: buttonTall)
        }
        
        
        
    }

    private func setupViews() {
        view.backgroundColor = UIColor.white
        
        view.addSubview(buttonTall)
        view.addSubview(buttonWide)
        
        
        buttonTall.frame = CGRect(x: 30, y: 30, width: 100, height: 400)
        buttonWide.frame = CGRect(x: 30, y: 480, width: 300, height: 100)
    }
    
    func addStretchyImage(_ image: UIImage, withContentsCenter contentsCenter: CGRect, toView view: UIView) {
        
        let layer = CALayer()
        layer.frame = view.bounds
        layer.contents = image.cgImage
        //don't forget this line - the image will not scale properly without it!
        layer.contentsScale = UIScreen.main.scale
        layer.contentsCenter = contentsCenter
    
        view.layer.addSublayer(layer)
        
    }


}

