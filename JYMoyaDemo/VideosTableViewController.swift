//
//  VideosTableViewController.swift
//  JYMoyaDemo
//
//  Created by jay on 2017/1/24.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class VideosTableViewController: UITableViewController {
    
    var repos = [AnyObject]()
    
    fileprivate func loadData() {
        
        DSProvider.request(DS.GetVideosByType(0, 12, 0, 1)) { (result) in
            
            switch result {
                
            case let .success(response):
                
                do {
                    
                    let json: Dictionary? = try response.mapJSON() as? Dictionary<String, AnyObject>
                    
                    if let json = json {
                        
                        if let contents: Array<AnyObject> = json["content"] as? Array<AnyObject> {
                            
                            self.repos = contents
                        
                        }
                    
                    }
                    
                    self.tableView.reloadData()
                    
                } catch {
                
                    
                }
                
            case let .failure(error):
                
                print(error)
                
                break
            
            }
        }
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return repos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuse", for: indexPath)
        
        let contentDic = repos[indexPath.row] as? Dictionary<String, AnyObject>
        
        cell.textLabel?.text = contentDic!["title"] as? String
        
        return cell
    }


}
