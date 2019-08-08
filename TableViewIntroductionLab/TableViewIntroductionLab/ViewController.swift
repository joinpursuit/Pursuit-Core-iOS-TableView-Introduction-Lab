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
        var cell = UITableViewCell()
        let date = logic[indexPath.row].dueDate
        let name = logic[indexPath.row].name
        cell.textLabel?.text = "\(name) : \(date)"
        return cell
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: (Int) -> Int ) {
//        switch
//    }
    
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

