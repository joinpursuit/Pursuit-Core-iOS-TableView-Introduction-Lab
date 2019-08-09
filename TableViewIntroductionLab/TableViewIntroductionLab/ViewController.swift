//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Task.allTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ourCell", for: indexPath)
        
        cell.backgroundColor = .lightGray
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = "\(Task.allTasks[indexPath.row].name)"
        cell.detailTextLabel?.text = "\(Task.allTasks[indexPath.row].description)"
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0:
            return Task.Status.notStarted.rawValue
        case 1:
            return Task.Status.inProgress.rawValue
        case 2:
            return Task.Status.completed.rawValue
        default:
            return "you broke it"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
}

