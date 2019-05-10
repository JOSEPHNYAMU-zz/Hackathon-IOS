//
//  MenuController.swift
//  News
//
//  Created by Joseph Njogu on 10/05/2019.
//  Copyright © 2019 Joseph Njogu. All rights reserved.
//

import UIKit

class MenuController: NSObject {
    
    let menuView = UIView()
    
    public func showMenu() {
        
        if let window = UIApplication.shared.keyWindow {
            
        menuView.frame = window.frame
            
            menuView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            window.addSubview(menuView)
            
            UIView.animate(withDuration: 0.5, animations: {
                self.menuView.alpha = 1
            })
            
        }
    }

}

