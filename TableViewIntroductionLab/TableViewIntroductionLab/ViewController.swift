//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let logic = Task.allTasks
    let tasks: [[Task]] = []

    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return logic.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let names = logic[indexPath.row].name
        let dates = "\(logic[indexPath.row].dueDate)"
        let cell = tableView.dequeueReusableCell(withIdentifier: "name")!
        cell.textLabel?.text = names
        cell.detailTextLabel!.text = dates
        
        return cell
    }
//        let date = logic[indexPath.row].dueDate
//        let name = logic[indexPath.row].name
//        cell.textLabel?.text = "\(name) : \(date)"
    

    
    
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//    }
    

//    func numberOfSections(in tableView: UITableView) -> Int {
//        return logic.count
//    }

    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

