//
//  ViewController.swift
//  News
//
//  Created by Joseph Njogu on 10/05/2019.
//  Copyright © 2019 Joseph Njogu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var tableView: UITableView!
    var allitemslist: [Item]? = []
    var source = "sports"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getNews(fromSource: source)
    }
    
    
    func getNews(fromSource provider: String) {
        let newsRequest = URLRequest(url: URL(string: "https://newsapi.org/v2/top-headlines?country=ch&category=\(provider)&apiKey=9a6484ffc34342e3877f5b19089c5224")!)
        let task = URLSession.shared.dataTask(with: newsRequest) {(data, response, error) in
            
            if error != nil {
                
                print("There is an Error")
                
                return
                
            }
            
            self.allitemslist = [Item]()
            
            do {
                
                let items = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as!
                    [String: AnyObject]
                
                if let allItems = items["articles"] as? [[String: AnyObject]] {
                    for singleItem in allItems {
                        
                        let news = Item()
                        
                        if let title = singleItem["title"] as? String, let author = singleItem["author"] as? String,
                            let body = singleItem["description"] as? String, let picture = singleItem["urlToImage"] as? String, let path = singleItem["url"] as? String {
                            
                            news.title = title
                            
                            news.body = body
                            
                            news.author = author
                            
                            news.path = path
                            
                            news.picture = picture
                            
                        }
                        
                        self.allitemslist?.append(news)
                    }
                }
                DispatchQueue.main.async {
                    
                    self.tableView.reloadData()
                    
                }
                
            } catch let error {
                
                print(error)
                
            }
            
        }
        
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let List = tableView.dequeueReusableCell(withIdentifier: "itemList", for: indexPath) as! ItemList
        
        if self.allitemslist?[indexPath.item].picture != nil &&  self.allitemslist?[indexPath.item].title != nil
            
            && self.allitemslist?[indexPath.item].body != nil &&  self.allitemslist?[indexPath.item].author != nil {
            
            List.title.text = self.allitemslist?[indexPath.item].title
            
            List.body.text = self.allitemslist?[indexPath.item].body
            
            List.author.text = self.allitemslist?[indexPath.item].author
            
            List.picture.getImage(from: (self.allitemslist?[indexPath.item].picture!)!)
            
        }
        
        return List
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.allitemslist?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       let id = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "web") as! WebviewViewController
        
        id.url = self.allitemslist?[indexPath.item].path
        
        self.present(id, animated: true, completion: nil)
        
    }
    
    let menuController = MenuController()
    @IBAction func menuPress(_ sender: Any) {
        
        menuController.showMenu()
        menuController.mainVC = self
    }
    
}

extension UIImageView {
    
    func getImage(from url: String) {
        
       let newsImage = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: newsImage) {(data, response, error) in
            
            if error != nil {

                print("No Image")

                return

            }
            
            DispatchQueue.main.async {
                
                self.image = UIImage(data: data!)
                
            }
            
        }
        task.resume()
    }
    
}


