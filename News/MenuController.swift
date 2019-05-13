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
    let arrayOfSources = ["Business", "Entertainment", "Health", "Science", "Sports", "Technology"]
    var mainVC: ViewController?
    
    public func showMenu() {
        
        if let window = UIApplication.shared.keyWindow {
            
        menuView.frame = window.frame
            
            menuView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            menuView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissMenu)))
            
            let height: CGFloat = 200
            
            let y = window.frame.height - height
            
            menuTableView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)
            
            window.addSubview(menuView)
            window.addSubview(menuTableView)
            
            UIView.animate(withDuration: 0.5, animations: {
                self.menuView.alpha = 1
                self.menuTableView.frame.origin.y = y
            })
            
        }
    }
    
    @objc public func dismissMenu() {
        
        UIView.animate(withDuration: 0.5, animations: {
            self.menuView.alpha = 0
            
            if let window = UIApplication.shared.keyWindow {
                self.menuTableView.frame.origin.y = window.frame.height
            }
            
        })
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayOfSources.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = arrayOfSources[indexPath.item]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        if let vc = mainVC {
            
            vc.source = arrayOfSources[indexPath.item].lowercased()
            vc.getNews(fromSource: arrayOfSources[indexPath.item].lowercased())
            dismissMenu()
        }
        
    }
    
    override init() {
        super.init()
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.isScrollEnabled = true
        menuTableView.bounces = true
        menuTableView.register(BaseViewCell.classForCoder(), forCellReuseIdentifier: "cellId")
    }

}

