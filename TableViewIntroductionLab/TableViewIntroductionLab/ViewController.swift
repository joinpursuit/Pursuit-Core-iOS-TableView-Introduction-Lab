//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var tasks = Task.allTasks{
        didSet{
            //reload the table view
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
    }

}

extension ViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        
        //object at current indexPath
        let cellObj = tasks[indexPath.row]
        
        cell.textLabel?.text = cellObj.name
        cell.detailTextLabel?.text = cellObj.dueDate.description
        
        return cell
    }
}
