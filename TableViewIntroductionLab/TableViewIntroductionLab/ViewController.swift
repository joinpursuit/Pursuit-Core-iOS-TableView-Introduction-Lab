//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
//    var ourTasks = Task.allTasks
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    
    
    @IBOutlet weak var ourTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Task.allTasks.count
       
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        
        
//        var notStarted: [Task]
//        var inProgress: [Task]
//        var completed: [Task]
//
//        for i in Task.allTasks {
//            if i.status == .notStarted {
//                notStarted.append(i)
//            } else if i.status == .inProgress {
//                inProgress.append(i)
//            } else if i.status == .completed {
//                completed.append(i)
//            }
//        }
        
        for (i,v) in Task.allTasks.enumerated() {
            for _ in indexPath {
                if i == indexPath.row {
//                    cell.textLabel?.text = "\(v.name) \n \(v.dueDate.description)"
                    cell.textLabel?.text = v.name
                    cell.detailTextLabel?.text = v.dueDate.description(with: .current)
                }
            }
        }
        
        return cell
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
        

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ourTableView.dataSource = self
        ourTableView.delegate = self
    }


}

