//
//  ViewController.swift
//  NSTimer_Swift
//
//  Created by Tech-zhangyangyang on 2017/4/26.
//  Copyright © 2017年 Tech-zhangyangyang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var count:NSInteger = 0
    var isStart:Bool  = false
    var timer:Timer!
    var btn:UIButton?
    var label:UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: 300))
        label?.backgroundColor = UIColor.gray
        label?.text = "点击开始倒计时按钮"
        label?.textAlignment = .center
        self.view.addSubview(label!)
        
        btn = UIButton.init(type: .custom)
        btn?.frame = CGRect.init(x: 0, y: 300, width: self.view.frame.size.width, height: self.view.frame.size.height - 300)
        btn?.setTitle("开始", for: .normal)
        btn?.setTitleColor(UIColor.black, for: .normal)
        btn?.backgroundColor = UIColor.yellow
        btn?.addTarget(self, action:#selector(clicked(_:)), for: .touchUpInside)
        self.view.addSubview(btn!)
        
        timer = Timer.init(timeInterval: 0.5, target: self, selector:#selector(timerAction), userInfo:nil, repeats:true)
    }
    
    func clicked(_ button:UIButton)  {
        isStart = !isStart
        if isStart {
            RunLoop.main.add(timer, forMode:RunLoopMode.defaultRunLoopMode)
            timer.fireDate = NSDate.distantPast
            btn?.setTitle("暂停", for: .normal)
        }else {
            timer.fireDate = NSDate.distantFuture
            btn?.setTitle("继续", for: .normal)
        }
    }
 
    func timerAction()  {
        count += 1
        label?.text = "\(count)"
    }
    
    deinit {
        if timer.isValid {
            timer.invalidate()
        }
        timer = nil
    }
}

