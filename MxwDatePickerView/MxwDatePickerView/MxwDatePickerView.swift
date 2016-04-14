//
//  MxwDatePickerView.swift
//  MxwDatePickerView
//
//  Created by luxtmxw on 16/4/13.
//  Copyright © 2016年 Bintao. All rights reserved.
//

import UIKit

class MxwDatePickerView: UIView {

    var pickerBackV = UIView()
    var datePickerV = UIDatePicker()
    var confirmBtn: UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        let window = UIApplication.sharedApplication().windows[0]
        self.frame = window.frame
        self.backgroundColor = UIColor(white: 0, alpha: 0.35)
        self.alpha = 0.0
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.hide))
        self.addGestureRecognizer(tap)
        
        pickerBackV.frame = CGRectMake(0, window.frame.size.height, window.frame.size.width, 232)
        pickerBackV.backgroundColor = UIColor.whiteColor()
        self.addSubview(pickerBackV)
        
        datePickerV.frame = CGRectMake(0, 20, window.frame.size.width, 212)
        datePickerV.minimumDate = NSDate.init(timeIntervalSinceNow: NSDate().timeIntervalSinceNow)
        datePickerV.minuteInterval = 15
        pickerBackV.addSubview(datePickerV)
        
        let cancelBtn = UIButton(frame: CGRectMake(5, 5, 30, 20))
        cancelBtn.setTitle("取消", forState: UIControlState.Normal)
        cancelBtn.titleLabel?.font = UIFont.systemFontOfSize(15)
        cancelBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        cancelBtn.userInteractionEnabled = false
        pickerBackV.addSubview(cancelBtn)
        
        confirmBtn = UIButton(frame: CGRectMake(window.frame.size.width - 10 - 30, 5, 30, 20))
        confirmBtn.setTitle("确定", forState: .Normal)
        confirmBtn.titleLabel?.font = UIFont.systemFontOfSize(15)
        confirmBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        pickerBackV.addSubview(confirmBtn)
    }
    
    func showPickerView() {
        UIView.animateWithDuration(0.3) { 
            self.alpha = 1.0
            self.pickerBackV.transform = CGAffineTransformMakeTranslation(0, -232)
        }
    }
    
    func hide() {
        UIView.animateWithDuration(0.3, animations: { 
            self.alpha = 0.0
            self.pickerBackV.transform = CGAffineTransformIdentity
            }) { (f) in
                self.removeFromSuperview()
        }
    }
    
    func setupData(target target: AnyObject, datePickerAction: Selector, comfirmAction: Selector) {
        confirmBtn.addTarget(target, action: comfirmAction, forControlEvents: UIControlEvents.TouchUpInside)
        datePickerV.addTarget(target, action: datePickerAction, forControlEvents: .ValueChanged)
    }
}
