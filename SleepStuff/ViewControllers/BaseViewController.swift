//
//  BaseViewController.swift
//  SleepStuff
//
//  Created by Robbe Vandecasteele on 03/06/2017.
//  Copyright © 2017 Robbe Vandecasteele. All rights reserved.
//

import UIKit
import PureLayout

class BaseViewController: UIViewController {
    
    var didSetupConstrainst: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTitle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func loadView() {
        self.view = UIView()
        self.view.backgroundColor = UIColor.white
        self.setupLoadView()
        
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
        
        self.view.setNeedsUpdateConstraints()
    }
    
    func setupTitle() {
        fatalError("should be overwritten")
    }
    
    func setupLoadView() {
        fatalError("should be overwritten")
    }
    
    func setupConstraints() {
        fatalError("should be overwritten")
    }
    
    override func updateViewConstraints() {
        if !self.didSetupConstrainst {
            self.setupConstraints()
            self.didSetupConstrainst = true
        }
        super.updateViewConstraints()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
