//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
                    UITableViewDataSource,
                    UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return Task.allTasks.filter({ $0.status == .notStarted }).count
        }
        if section == 1 {
            return Task.allTasks.filter({ $0.status == .inProgress }).count
        }
        if section == 2 {
            return Task.allTasks.filter({ $0.status == .completed }).count
        }
        return Task.allTasks.count
    }
    
    // break the tasks up into three sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "Not Started"
        case 1:
            return "In Progress"
        case 2:
            return "Completed"
        default:
            return "WTF!"
        }
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Returns a reusable table-view cell object located by its identifier refering to the Prototype so we can set up different styles and use them however you want.
        let cell = taskTableView.dequeueReusableCell(withIdentifier: "cellTask")
        
        if let unwrappedCell = cell {
            
            if indexPath.section == 0 {
            // we passed the name to the textLabel
            unwrappedCell.textLabel?.text =
                Task.allTasks.filter({ $0.status == .notStarted })[indexPath.row].name
            // passed the date into the subtitle using the detailTextLabel and return the date as a string using the duedate's description property.
            unwrappedCell.detailTextLabel?.text =
                Task.allTasks.filter({ $0.status == .notStarted })[indexPath.row].dueDate.description(with: .autoupdatingCurrent)
            }
            
            if indexPath.section == 1 {
             
                unwrappedCell.textLabel?.text =
                    Task.allTasks.filter({ $0.status == .inProgress })[indexPath.row].name
              
                unwrappedCell.detailTextLabel?.text =
                    Task.allTasks.filter({ $0.status == .inProgress })[indexPath.row].dueDate.description(with: .autoupdatingCurrent)
            }
            
            if indexPath.section == 2 {
               
                unwrappedCell.textLabel?.text =
                    Task.allTasks.filter({ $0.status == .completed })[indexPath.row].name
              
                unwrappedCell.detailTextLabel?.text =
                    Task.allTasks.filter({ $0.status == .completed
                    
                })[indexPath.row].dueDate.description(with: .autoupdatingCurrent)
            }
            
            
            
        
            return unwrappedCell
        }
        return UITableViewCell()
    }
    
    @IBOutlet weak var taskTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        taskTableView.dataSource = self
        taskTableView.delegate = self
    }


}

