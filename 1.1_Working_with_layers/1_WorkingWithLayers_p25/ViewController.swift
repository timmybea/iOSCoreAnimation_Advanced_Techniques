//
//  ViewController.swift
//  1_WorkingWithLayers_p25
//
//  Created by Tim Beals on 2017-03-06.
//  Copyright © 2017 Tim Beals. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let layerView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        view.backgroundColor = UIColor.white
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        //addBlueLayer()
        addImageContents()
    }

    private func setupViews() {
        
        view.backgroundColor = UIColor.lightGray
        
        view.addSubview(layerView)
        layerView.center = view.center
    }
    
    private func addBlueLayer() {
        
        let blueLayer = CALayer()
        blueLayer.backgroundColor = UIColor.blue.cgColor
        blueLayer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        layerView.layer.addSublayer(blueLayer)
        
    }

    private func addImageContents() {
        
        let dinoImage = UIImage(named: "triceratops")
        layerView.layer.contents = dinoImage?.cgImage
        //layerView.layer.contentsScale = UIScreen.main.scale
        //1x, 2x, or 3x resolution(retina display)
        
        layerView.layer.contentsGravity = kCAGravityCenter
        layerView.layer.masksToBounds = true
        
        //define the part of the contents (image) that you want to see in your view.
        layerView.layer.contentsRect = CGRect(x: 0.7, y: 0, width: 0.5, height: 0.5)
        
        //layerView.layer.contentsGravity = kCAGravityResizeAspect
        //resizes to fit perfectly inside the layer's bounds
        
    }
    
    
}

