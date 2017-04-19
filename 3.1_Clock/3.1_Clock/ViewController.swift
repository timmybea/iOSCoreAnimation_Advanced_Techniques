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
        view.contentMode = .scaleAspectFill
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
        hoursHand.layer.anchorPoint = CGPoint(x: 0.5, y: 0.9)
        
        minutesHand.frame = CGRect(x: 0, y: 0, width: 3, height: 122)
        minutesHand.center = view.center
        minutesHand.layer.anchorPoint = CGPoint(x: 0.5, y: 0.9)

        secondsHand.frame = CGRect(x: 0, y: 0, width: 3, height: 144)
        secondsHand.center = view.center
        secondsHand.layer.anchorPoint = CGPoint(x: 0.5, y: 0.9)
        
    }
    
    func setupTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
    }
    
    
    func tick() {
        
        //http://stackoverflow.com/questions/38248941/how-to-get-time-hour-minute-second-in-swift-3-using-nsdate
        let date = NSDate()
        
        var calendar = NSCalendar.current
        
        let unitFlags = Set<Calendar.Component>([.hour, .minute, .second])
        calendar.timeZone = TimeZone(identifier: "America/Los_Angeles")!
        
        let components = calendar.dateComponents(unitFlags, from: date as Date)
        
        //Calculate hands angle

        let hoursAngle: CGFloat = CGFloat((Double(components.hour!) / 12.0) * Double.pi * 2.0)
     
        let minsAngle: CGFloat = CGFloat((Double(components.minute!) / 60.0) * Double.pi * 2.0)
        
        let secsAngle: CGFloat = CGFloat((Double(components.second!) / 60.0) * Double.pi * 2.0)
        
        self.hoursHand.transform = CGAffineTransform(rotationAngle: hoursAngle)
        self.minutesHand.transform = CGAffineTransform(rotationAngle: minsAngle)
        self.secondsHand.transform = CGAffineTransform(rotationAngle: secsAngle)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

