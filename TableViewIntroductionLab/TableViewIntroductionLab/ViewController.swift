//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var taskTable: UITableView!
    
    @IBOutlet weak var SortButton: UIButton!
    
    var notStartedArray = Task.allTasks.filter {$0.status == .notStarted}
    var inProgressArray = Task.allTasks.filter {$0.status == .inProgress}
    var completedArray = Task.allTasks.filter {$0.status == .completed}
    
    var switchState = true

    @IBAction func SortBtn(_ sender: UIButton) {
        
        switch switchState{
        case true:
            notStartedArray = sortAsending(notStartedArray)
            inProgressArray = sortAsending(inProgressArray)
            completedArray = sortAsending(completedArray)
            taskTable.reloadData()
            SortButton.setTitle("Sort Descending", for: .normal)
            switchState = false
        case false:
            notStartedArray = sortDescending(notStartedArray)
            inProgressArray = sortDescending(inProgressArray)
            completedArray = sortDescending(completedArray)
            taskTable.reloadData()
            SortButton.setTitle("Sort Ascending", for: .normal)
            switchState = true
        }
    }
    
    func sortAsending(_ arr: [Task])->[Task]{
        return arr.sorted(by: { $0.dueDate.compare($1.dueDate) == .orderedAscending })
    }
    
    func sortDescending(_ arr: [Task])->[Task]{
        return arr.sorted(by: { $0.dueDate.compare($1.dueDate) == .orderedDescending })
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
            return "IDK"
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
   
        switch indexPath.section {
        case 0:
            cell.textLabel?.text =             notStartedArray[indexPath.row].name
            cell.detailTextLabel?.text = notStartedArray[indexPath.row].dueDate.description
            
        case 1:
            cell.textLabel?.text =             inProgressArray[indexPath.row].name
            cell.detailTextLabel?.text = inProgressArray[indexPath.row].dueDate.description
        case 2:
           cell.textLabel?.text =             completedArray[indexPath.row].name
           cell.detailTextLabel?.text = completedArray[indexPath.row].dueDate.description
        default:
            fatalError()
        }
        return cell
    }
    
    func convertDateFormater(_ date: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss z"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return  dateFormatter.string(from: date!)
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
//            return notStartedCount
            return notStartedArray.count
        case 1:
//            return inProgressCount
            return inProgressArray.count
        case 2:
//            return completedCount
            return completedArray.count
        default:
            print("IDK")
            return -1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTable.dataSource = self
        // Do any additional setup after loading the view.
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        taskTable.cellForRow(at indexPath)?.accesoryType = .none
        
    }
    
}
