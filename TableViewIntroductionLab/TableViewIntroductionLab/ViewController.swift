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
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    

    //returns amount of sections in view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return Task.organizeByStatus()[0].count
        case 1:
            return Task.organizeByStatus()[1].count
        case 2:
            return Task.organizeByStatus()[2].count
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
            cell.detailTextLabel?.text = Task.allTasks[indexPath.row].dueDate.description(with: Locale.autoupdatingCurrent)
        } else if indexPath.section == 1 {
            cell.textLabel?.text = Task.allTasks[indexPath.row].name
            cell.detailTextLabel?.text = Task.allTasks[indexPath.row].dueDate.description(with: Locale.autoupdatingCurrent)
        } else if indexPath.section == 2 {
            cell.textLabel?.text = Task.allTasks[indexPath.row].name
            cell.detailTextLabel?.text = Task.allTasks[indexPath.row].dueDate.description(with: Locale.autoupdatingCurrent)
        }
        return cell
    }

}

