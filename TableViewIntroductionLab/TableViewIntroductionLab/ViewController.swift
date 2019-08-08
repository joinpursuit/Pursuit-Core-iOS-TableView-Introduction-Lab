//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return Task.allTasks.count
        case 1:
            return Task.allTasks.count
        default:
            return Task.allTasks.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellOne")
        let rowsToSetup = indexPath.row
        let taskInRow = Task.allTasks[rowsToSetup]
        if let unwrapCell = cell {
            unwrapCell.textLabel?.text = "\(taskInRow.name)"
            unwrapCell.detailTextLabel?.text = "\(taskInRow.dueDate.description(with: .autoupdatingCurrent))"
            return unwrapCell
        }
        return UITableViewCell()
        //cell.textLabel?.text = "\(taskInRow.name)\n\(taskInRow.dueDate.description(with: .autoupdatingCurrent))"
       // cell.textLabel?.numberOfLines = 2
        //cell.textLabel?.text = taskInRow.name
        //cell.detailTextLabel?.text = taskInRow.dueDate.description
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        
    }
    

}

