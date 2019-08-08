//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var notStarted = [Task]()
    var inProgress = [Task]()
    var completed = [Task]()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return notStarted.count
        case 1:
            return inProgress.count
        case 2:
            return completed.count
        default:
            print("wth")
            return -1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = notStarted[indexPath.row].name
            cell.detailTextLabel?.text = notStarted[indexPath.row].dueDate.description
        case 1:
            cell.textLabel?.text = inProgress[indexPath.row].name
            cell.detailTextLabel?.text = inProgress[indexPath.row].dueDate.description
        case 2:
            cell.textLabel?.text = completed[indexPath.row].name
            cell.detailTextLabel?.text = completed[indexPath.row].dueDate.description
        default:
            print("tableviews are stupid")
        }
        
        
        return cell
        
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
            return "boii"
        }
    }
    
    
    @IBOutlet weak var tableOutlet: UITableView!
    
    
    func separateData() {
        for i in Task.allTasks {
            if i.status == .notStarted {
                notStarted.append(i)
            }
        }
        
        for i in Task.allTasks {
            if i.status == .inProgress {
                inProgress.append(i)
            }
        }
        
        for i in Task.allTasks {
            if i.status == .completed {
                completed.append(i)
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableOutlet.dataSource = self
        tableOutlet.delegate = self
        
        separateData()
       
    }


}

