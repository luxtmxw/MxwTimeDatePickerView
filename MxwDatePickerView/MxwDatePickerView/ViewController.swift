//
//  ViewController.swift
//  MxwDatePickerView
//
//  Created by luxtmxw on 16/4/13.
//  Copyright © 2016年 Bintao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var mxwPickerView: MxwDatePickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func Action(sender: AnyObject) {
        let window = UIApplication.sharedApplication().windows[0]
        mxwPickerView = MxwDatePickerView(frame: window.frame)
        view.addSubview(mxwPickerView)
        mxwPickerView.showPickerView()
        
        mxwPickerView.setupData(target: self, datePickerAction: #selector(self.datePickerAction), comfirmAction: #selector(confirmAction))
        
    }
    
    func datePickerAction() {
        
    }
    
    func confirmAction() {
        mxwPickerView.hide()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

