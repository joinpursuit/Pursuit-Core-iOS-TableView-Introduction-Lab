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
            return filterAccordingToStatus(arr: Task.allTasks, state: .notStarted).count
        case 1:
            return filterAccordingToStatus(arr: Task.allTasks, state: .inProgress).count
        case 2:
            return filterAccordingToStatus(arr: Task.allTasks, state: .completed).count
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
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Not Started"
        case 1:
            return "In Progress"
        case 2:
            return "Completed"
        default:
            print("default")
        }
        return "didn't work"
    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let header = UIView()
//        header.backgroundColor = .white
//        return header
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        
    }
    

}

