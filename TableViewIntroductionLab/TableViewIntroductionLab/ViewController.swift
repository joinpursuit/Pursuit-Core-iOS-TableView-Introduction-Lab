//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var sortOrderButton: UIButton!
    
    @IBAction func sortOrderButton(_ sender: UIButton) {
        
    }
    
//    func isEnabledButton(){
//        for _ in sortOrderButton{
//            _.isEnabled = true
//        }
//    }
//    
    
    
    var notStarted: [Task] = []
    var complete: [Task] = []
    var inProgress: [Task] = []
    
    var tasks = Task.allTasks
    
    
    func separator () {
        for i in Task.allTasks {
            if i.status == .completed {
                complete.append(i)
            } else {
                if i.status == .inProgress {
                    inProgress.append(i)
                } else {
                    if i.status == .notStarted {
                        notStarted.append(i)
                    }
                }
            }
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
       return  notStarted.count
        case 1:
         return inProgress.count
        case 2:
            return complete.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let date = tasks[indexPath.row].dueDate
        let name = tasks[indexPath.row].name
        
        let myTable = tableView.dequeueReusableCell(withIdentifier: "TaskName")!
        myTable.textLabel?.text = ("\(name)")
         myTable.detailTextLabel?.text = ("\(date)")
        
        return myTable
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
            return "will not execute"
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // tableView.delegate = self
        tableView.dataSource = self
        separator()
        
        // Do any additional setup after loading the view.
    }


}

