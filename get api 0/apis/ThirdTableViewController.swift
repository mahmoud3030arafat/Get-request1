//
//  ThirdTableViewController.swift
//  apis
//
//  Created by Mahmoud on 8/26/21.
//  Copyright © 2021 mahmoud. All rights reserved.
//

import UIKit

class ThirdTableViewController: UITableViewController {
 var arr = [articles]()
    override func viewDidLoad() {
        super.viewDidLoad()
        ApiService.shared.getNews()

     print(arr)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "go", for: indexPath)
        cell.textLabel?.text = arr[indexPath.row].description
        

        return cell
    }
    


    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
