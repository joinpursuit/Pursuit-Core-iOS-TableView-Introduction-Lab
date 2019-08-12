//
//  sortByDate.swift
//  TableViewIntroductionLab
//
//  Created by Anthony Gonzalez on 8/11/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

func sortByDateAscending(taskArrayToSort: [Task]) -> [Task] {
    var sortedTaskInFunction = taskArrayToSort
   sortedTaskInFunction = taskArrayToSort.sorted(by: {$0.dueDate.compare($1.dueDate) == .orderedAscending })
    return sortedTaskInFunction
}


func sortByDateDescending(taskArrayToSort: [Task]) -> [Task] {
    var sortedTaskInFunction = taskArrayToSort
    sortedTaskInFunction = taskArrayToSort.sorted(by: {$0.dueDate.compare($1.dueDate) == .orderedDescending })
    return sortedTaskInFunction
}
