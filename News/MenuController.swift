//
//  MenuController.swift
//  News
//
//  Created by Joseph Njogu on 10/05/2019.
//  Copyright © 2019 Joseph Njogu. All rights reserved.
//

import UIKit

class MenuController: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    let menuView = UIView()
    let menuTableView = UITableView()
    
    public func showMenu() {
        
        if let window = UIApplication.shared.keyWindow {
            
        menuView.frame = window.frame
            
            menuView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            menuView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissMenu)))
            
            window.addSubview(menuView)
            
            UIView.animate(withDuration: 0.5, animations: {
                self.menuView.alpha = 1
            })
            
        }
    }
    
    @objc public func dismissMenu() {
        
        UIView.animate(withDuration: 0.5, animations: {
            self.menuView.alpha = 0
        })
        
    }
    
    
    
    override init() {
        super.init()
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.isScrollEnabled = true
        menuTableView.bounces = true
    }

}

