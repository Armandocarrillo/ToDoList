//
//  ToDo.swift
//  ToDoList
//
//  Created by Armando Carrillo on 25/07/20.
//  Copyright © 2020 Armando Carrillo. All rights reserved.
//

import Foundation

struct ToDo{
    var title: String
    var isComplete: Bool
    var duDate : Date
    var notes: String?
    
    static func loadToDos() -> [ToDo]? {
        return nil
    }
   static func loadSampleToDo() -> [ToDo] {
    /* return [
    ToDo(title: "To do One ", isComplete: false, duDate: Date(), notes: "Notes 1"),
    ToDo(title: "To do Two", isComplete: false, duDate: Date(), notes: "Notes 2"),
    ToDo(title: "To do Three", isComplete: false, duDate:Date() , notes: "Notes 3")]
     */
 
    let todo1 = ToDo(title: "To do One ", isComplete: false, duDate: Date(), notes: "Notes 1")
    let todo2 = ToDo(title: "To do Two", isComplete: false, duDate: Date(), notes: "Notes 2")
    let todo3 = ToDo(title: "To do Three", isComplete: false, duDate:Date() , notes: "Notes 3")
 
    return [todo1, todo2, todo3]
    }
   
      
    

}
