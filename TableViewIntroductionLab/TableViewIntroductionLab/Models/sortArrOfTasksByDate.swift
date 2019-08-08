//
//  sortArrOfTasksByDate.swift
//  TableViewIntroductionLab
//
//  Created by Angela Garrovillas on 8/8/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation
func sortByDate(arr: [Task], sort: ScrollByDate) -> [Task] {
    var newArr = arr
    switch sort {
    case .ascending:
       newArr.sort(by: {(a: Task,b: Task) -> Bool in return a.dueDate < b.dueDate})
        return newArr
    case .descending:
       newArr.sort(by: {(a: Task,b: Task) -> Bool in return a.dueDate > b.dueDate})
        return newArr
    }
}
