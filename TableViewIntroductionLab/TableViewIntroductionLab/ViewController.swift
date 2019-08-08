//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    var completedTaksCounter = 0
    var inProgressTasksCounter = 0
    var notStartedTasksCounter = 0

    func countTaskByStatus() -> Void {
        for task in Task.allTasks {
            if task.status == Task.Status.completed {
                completedTaksCounter += 1
            } else if task.status == Task.Status.inProgress{
                inProgressTasksCounter += 1
            } else if task.status == Task.Status.notStarted {
                notStartedTasksCounter += 1
            }
        }
    }
    //returns amount of sections in view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return completedTaksCounter
        case 1:
            return inProgressTasksCounter
        case 2:
            return notStartedTasksCounter
        default:
            return -1
        }

    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Completed"
        case 1:
            return "In Progress"
        case 2:
            return "Not Started"
        default:
            return "IDK"
        }
    }
    
    //returns content of each cell
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
//        cell.textLabel?.text = Task.allTasks[indexPath.row].name
//        return cell
//    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TasksCell", for: indexPath)

        if indexPath.section == 0 {
            cell.textLabel?.text = Task.allTasks[indexPath.row].name
        } else if indexPath.section == 1 {
            cell.textLabel?.text = Task.allTasks[indexPath.row].name
        } else if indexPath.section == 1 {
            cell.textLabel?.text = Task.allTasks[indexPath.row].name
        }
        return cell
    }

}

