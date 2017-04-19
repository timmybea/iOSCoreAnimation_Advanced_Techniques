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
    
    let secondsHand: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "second_hand")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let minutesHand: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "minute_hand")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let hoursHand: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "hour_hand")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        
        setupViews()
        setupTimer()
    }
    
    
    func setupViews() {
        view.addSubview(clockFace)
        view.addSubview(hoursHand)
        view.addSubview(minutesHand)
        view.addSubview(secondsHand)
        
        clockFace.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        clockFace.center = view.center
        
        hoursHand.frame = CGRect(x: 0, y: 0, width: 6, height: 122)
        hoursHand.center = view.center

        minutesHand.frame = CGRect(x: 0, y: 0, width: 3, height: 122)
        minutesHand.center = view.center

        secondsHand.frame = CGRect(x: 0, y: 0, width: 3, height: 144)
        secondsHand.center = view.center
    }
    
    func setupTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
    }
    
    
    func tick() {
        print("Hello")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

