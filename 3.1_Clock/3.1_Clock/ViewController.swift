//
//  ViewController.swift
//  3.1_Clock
//
//  Created by Tim Beals on 2017-04-17.
//  Copyright © 2017 Tim Beals. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let clockFace: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "clock_face")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        
        setupViews()
    }
    
    
    func setupViews() {
        view.addSubview(clockFace)
        
        
        clockFace.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        clockFace.center = view.center

    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

