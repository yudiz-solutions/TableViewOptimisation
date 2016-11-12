//
//  ViewController.swift
//  TableView Optimisation
//
//  Created by Yudiz Solutions Pvt.Ltd. on 10/11/16.
//  Copyright © 2016 Yudiz Solutions Pvt.Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    var arrName = [Dictionary<String,String>]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dict = [
            "name":"Ethon Hunt",
            "post":"Ajent",
            "isFollow":"0",
            "img":"ethon"
        ]
        
        let dict1 = [
            "name":"Britiny Lamp",
            "post":"Designer",
            "isFollow":"1",
            "img":"pc"
        ]
        
        let dict2 = [
            "name":"Steve Jobs",
            "post":"CEO",
            "isFollow":"1",
            "img":"ethon"
        ]
        
        let dict3 = [
            "name":"Harminy Pagge",
            "post":"Director",
            "isFollow":"0",
            "img":"pc"
        ]
        
        arrName = []
        
        for i in 1...200 {
            switch i % 4 {
            case 0:
                arrName.append(dict)
            case 1:
                arrName.append(dict1)
            case 2:
                arrName.append(dict2)
            default:
                arrName.append(dict3)
            }
        }
        
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 50
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as! UserCell
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let userCell = cell as? UserCell {
            
            let dict = arrName[indexPath.row]
            userCell.lblName.text = dict["name"]
            userCell.lblPost.text = dict["post"]
            userCell.btnFollow.isSelected = dict["isFollow"] == "1"
            userCell.imgProfile.image = UIImage(named:dict["img"]!)
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

