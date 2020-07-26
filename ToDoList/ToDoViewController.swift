//
//  ToDoViewController.swift
//  ToDoList
//
//  Created by Armando Carrillo on 25/07/20.
//  Copyright © 2020 Armando Carrillo. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
     var todo : ToDo?
    
    //save button depending on text exists in the text field
    func updateSaveButtonState(){
        let text = titleTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    //display a string from picker
    func updateDueDateLabel(date: Date){
        dueDateLabel.text = ToDo.dueDateFormatter.string(from: date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDueDateLabel(date: dueDatePicker.date)
        updateSaveButtonState()
        
        dueDatePicker.date = Date().addingTimeInterval(24*60*60)
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    var isPickerHidden = true
   
  
 
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let normalCellHeight = CGFloat(44)
        let largeCellHeight = CGFloat(216)
        let ceroCellHeight = CGFloat(0)
        
       
        switch (indexPath) {
        case [0,0]: //texfield
            return normalCellHeight
            
        case [0,1]: //due date cell
            return normalCellHeight
           
        case [0,2]: //due date picker
           return isPickerHidden ? ceroCellHeight : largeCellHeight
            
        case [0,3]: // notes text field
            return largeCellHeight
    
        default:
            return normalCellHeight
            
         }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath) {
        case [0,1]:
            isPickerHidden = !isPickerHidden
            
            dueDateLabel.textColor = isPickerHidden ? .black : tableView.tintColor
            
            tableView.beginUpdates()
            tableView.endUpdates()
            
        default:
            break
        }
    }

   
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    @IBAction func returnPressed(_ sender: UITextField) {
        titleTextField.resignFirstResponder()
    }
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        isCompleteButton.isSelected = !isCompleteButton.isSelected
    }
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        updateDueDateLabel(date: dueDatePicker.date)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
       
        guard  segue.identifier == "saveUnwind" else { return }
        
        let title = titleTextField.text!
        let isComplete = isCompleteButton.isSelected
        let dueDate = dueDatePicker.date
        let notes = notesTextView.text
        
        todo = ToDo(title: title, isComplete: isComplete, duDate: dueDate, notes: notes)
    }
    

}
