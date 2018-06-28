//
//  taskManager.swift
//  ToDo
//
//  Created by Tarlan Askaruly on 28.06.2018.
//  Copyright © 2018 Tarlan Askaruly. All rights reserved.
//

import Foundation
import UIKit

var taskMgr: TaskManager = TaskManager()

struct task{
    var name = "Un-named"
    var date = "Un-dated"
    var rubric = "Un-rubriced"
}

class TaskManager: NSObject {

    var tasks = [task]()
    
    func addTask(name: String, date: String, rubric: String){
        tasks.append(task(name: name, date: date, rubric: rubric))
    }
    
}
