//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var sortedOutlet: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var notStarted = Task.allTasks.filter {$0.status == .notStarted}
    var inProgress = Task.allTasks.filter {$0.status == .inProgress}
    var completed = Task.allTasks.filter {$0.status == .completed}
    //This goes through the Task struct which contains the allTasks array (an array of Tasks) and filters through it based on the status. Then, it is set to a variable.
    
    
    @IBAction func sortedButtonPress(_ sender: UIButton) {
        switch sortedOutlet.currentTitle { //Switches based on the the text of the button title.
        case "Sort Ascending":
            notStarted = sortByDateAscending(taskArrayToSort: notStarted)
            inProgress = sortByDateAscending(taskArrayToSort: inProgress)
            completed = sortByDateAscending(taskArrayToSort: completed)
            sortedOutlet.setTitle("Sort Descending", for: .normal)
            tableView.reloadData() //Reloads everything upon press
            
        case "Sort Descending":
            notStarted = sortByDateDescending(taskArrayToSort: notStarted)
            inProgress = sortByDateDescending(taskArrayToSort: inProgress)
            completed  = sortByDateDescending(taskArrayToSort: completed)
            sortedOutlet.setTitle("Sort Ascending", for: .normal)
            tableView.reloadData()
        default: ()
        }
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3 // Because notStarted/inProgress/Completed
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return notStarted.count
        case 1: return inProgress.count
        case 2: return completed.count
        default: return 0 //Never executed
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
        default: return ""
        }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") ?? UITableViewCell() //Allows the cell made in storyboard to be reused for different shit.
       
        switch indexPath.section { //IndexPath is a list of indexes that together represent the path to a specific location in a tree of nested arrays. This then goes by the section.
        case 0:
            cell.textLabel?.text = notStarted[indexPath.row].name
            cell.detailTextLabel?.text = notStarted[indexPath.row].dueDate.description(with: .autoupdatingCurrent) //(with: .autoupdatingCurrent) tracks the users current preferences and, in this case, changes the dates to be more readable.
        case 1:
            cell.textLabel?.text = inProgress[indexPath.row].name
            cell.detailTextLabel?.text = inProgress[indexPath.row].dueDate.description(with: .autoupdatingCurrent)
        case 2:
            cell.textLabel?.text = completed[indexPath.row].name
            cell.detailTextLabel?.text = completed[indexPath.row].dueDate.description(with: .autoupdatingCurrent)
        default: ()
        }
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
}

