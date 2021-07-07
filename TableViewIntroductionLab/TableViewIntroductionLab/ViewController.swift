//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var notStartedArray = Task.allTasks.filter {$0.status == .notStarted}
    var inProgressArray = Task.allTasks.filter {$0.status == .inProgress}
    var completedArray = Task.allTasks.filter {$0.status == .completed}
    var ascending = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        button.setTitle("Sort Ascending", for: .normal)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return notStartedArray.count
        case 1:
            return inProgressArray.count
        case 2:
            return completedArray.count
        default:
            return -1
        }
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
            return "This shouldn't happen"
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Task Cell") ?? UITableViewCell()
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = notStartedArray[indexPath.row].name
            cell.detailTextLabel?.text = notStartedArray[indexPath.row].dueDate.description
        case 1:
            cell.textLabel?.text = inProgressArray[indexPath.row].name
            cell.detailTextLabel?.text = inProgressArray[indexPath.row].dueDate.description
        case 2:
            cell.textLabel?.text = completedArray[indexPath.row].name
            cell.detailTextLabel?.text = completedArray[indexPath.row].dueDate.description
        default:
            fatalError()
            
        }

        return cell
    }
    
    @IBAction func sortButton(_ sender: UIButton) {
        
        switch ascending {
        case true:
            notStartedArray = notStartedArray.sorted {$0.dueDate.compare($1.dueDate) == .orderedAscending}
            inProgressArray = inProgressArray.sorted {$0.dueDate.compare($1.dueDate) == .orderedAscending}
            completedArray = completedArray.sorted {$0.dueDate.compare($1.dueDate) == .orderedAscending}
            
            tableView.reloadData()
            button.setTitle("Sort Descending", for: .normal)
            ascending = false
        case false:
            notStartedArray = notStartedArray.sorted {$0.dueDate.compare($1.dueDate) == .orderedDescending}
            inProgressArray = inProgressArray.sorted {$0.dueDate.compare($1.dueDate) == .orderedDescending}
            completedArray = completedArray.sorted {$0.dueDate.compare($1.dueDate) == .orderedDescending}
            
            tableView.reloadData()
            button.setTitle("Sort Ascending", for: .normal)
            ascending = true
        }
    }
    
    
}

