//
//  ViewController.swift
//  2.3_making_a_sprite_sheet
//
//  Created by Tim Beals on 2017-03-06.
//  Copyright © 2017 Tim Beals. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let spriteOne: UIView = {
        let view = UIView()
        return view
    }()
    
    let spriteTwo: UIView = {
        let view = UIView()
        return view
    }()
    
    
    let spriteThree: UIView = {
        let view = UIView()
        return view
    }()
    
    let spriteFour: UIView = {
        let view = UIView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = UIColor.white
        addSpriteViews()
        
        let image = UIImage(named: "sprite_buttons")
        
        
        addImage(image!, withContentRect: CGRect(x: 0, y: 0, width: 0.5, height: 0.5), toLayer: spriteOne.layer)
        addImage(image!, withContentRect: CGRect(x: 0, y: 0.5, width: 0.5, height: 0.5), toLayer: spriteTwo.layer)
        addImage(image!, withContentRect: CGRect(x: 0.5, y: 0, width: 0.5, height: 0.5), toLayer: spriteThree.layer)
        addImage(image!, withContentRect: CGRect(x: 0.5, y: 0.5, width: 0.5, height: 0.5), toLayer: spriteFour.layer)
        
    }
    
    private func addSpriteViews() {
        
        let spriteViews: [UIView] = [spriteOne, spriteTwo, spriteThree, spriteFour]

        for (index, spriteView) in spriteViews.enumerated() {
            view.addSubview(spriteView)
            
            spriteView.backgroundColor = UIColor.lightGray
            let offset = CGFloat(index * 60)
            spriteView.frame = CGRect(x: 20, y: 20 + offset, width: 48, height: 48)
        }
    }
    
    func addImage(_ image: UIImage, withContentRect contentsRect: CGRect, toLayer layer: CALayer) {
        
        layer.contents = image.cgImage
        layer.contentsGravity = kCAGravityResizeAspect
        layer.contentsRect = contentsRect
    }
    
    
    

}

