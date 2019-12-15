//
//  ViewController.swift
//  TVIntroLab
//
//  Created by Ahad Islam on 12/14/19.
//  Copyright © 2019 Ahad Islam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Task Cell")
        return tableView
    }()
    
    
    let cell = UITableViewCell()
    
    private var tasks = Task.allTasks {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }


}

