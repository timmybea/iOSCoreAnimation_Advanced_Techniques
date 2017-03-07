//
//  ViewController.swift
//  2.5_Layer_Delegate_drawRect
//
//  Created by Tim Beals on 2017-03-07.
//  Copyright © 2017 Tim Beals. All rights reserved.
//
//Note: The circle that we have drawn is clipped to the layer bounds even though we have
//not enabled the masksToBounds property. That’s because when you draw the
//backing image using the CALayerDelegate, the CALayer creates a drawing
//context with the exact dimensions of the layer.

import UIKit

class ViewController: UIViewController, CALayerDelegate {

    let playView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        view.backgroundColor = UIColor.white
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        createLayer()
    }

    func setupViews() {
        
        view.backgroundColor = UIColor.lightGray
        view.addSubview(playView)
        
        playView.center = view.center
    }
    
    func createLayer() {
        let blueLayer = CALayer()
        blueLayer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        blueLayer.backgroundColor = UIColor.blue.cgColor
        blueLayer.delegate = self //do this to access delegate method
        blueLayer.contentsScale = UIScreen.main.scale
        playView.layer.addSublayer(blueLayer)
        blueLayer.display() //this calls the drawLayer in ctx func
    }
    
    //MARK: delegate method
    func draw(_ layer: CALayer, in ctx: CGContext) {
        ctx.setLineWidth(10)
        ctx.setStrokeColor(UIColor.red.cgColor)
        ctx.strokeEllipse(in: layer.bounds)
    }
    
}

