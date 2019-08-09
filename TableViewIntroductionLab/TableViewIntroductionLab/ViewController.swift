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
    
    let organizedTasks = Task.organizeByStatus()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    

    //returns amount of sections in view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return organizedTasks[section].count
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TasksCell", for: indexPath)
        let name = organizedTasks[indexPath.section][indexPath.row].name
        let date = organizedTasks[indexPath.section][indexPath.row].dueDate.description(with: Locale.autoupdatingCurrent)
        
        cell.textLabel?.text = name
        cell.detailTextLabel?.text = date
     
        return cell
    }

}

