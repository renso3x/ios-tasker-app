//
//  TaskerTableViewController.swift
//  ShoppingCart
//
//  Created by Romeo Enso on 13/01/2018.
//  Copyright © 2018 Romeo Enso. All rights reserved.
//

import UIKit
import SwipeCellKit

class TaskerTableViewController: UITableViewController, SwipeTableViewCellDelegate {

    var lists = [
        ["Tootbrush", "Roll on", "Water 1 Liter", "Rebisco Crackers"],
        ["Eat dinner", "Watch Movies", "Read Watchtower"],
        ["Lead the group 3", "Return Visit", "Conduct Bible Study"]
    ]
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //register xib cell
        let nib = UINib(nibName: "ListTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "listCell")
        tableView.backgroundColor = UIColor.darkGray
        tableView.rowHeight = 80
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - delegate methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists[currentIndex].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListTableViewCell
        
        cell.customInit(text: lists[currentIndex][indexPath.row])
    
        cell.delegate = self
    
        return cell
    }
    
    @IBAction func addTask(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add Task", message: "", preferredStyle: .alert)
        
        let addButton = UIAlertAction(title: "Add", style: .default) { (alertData) in
            
            self.lists[self.currentIndex].append(textField.text!)
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertText) in
            alertText.placeholder = "Add task"
            textField = alertText
        }
        
        alert.addAction(addButton)
        
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - SwipeKit delegate
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            // handle action by updating model with deletion
            //            self.updateModel(at: indexPath)
            self.lists[self.currentIndex].remove(at: indexPath.row)
        }
        
        // customize the action appearance
        deleteAction.image = UIImage(named: "delete-icon")
        
        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeTableOptions {
        var options = SwipeTableOptions()
        options.expansionStyle = .destructive
        
        return options
    }
    
    //MARK: - Segment control method
    @IBAction func switchSegment(_ sender: UISegmentedControl) {
        currentIndex = sender.selectedSegmentIndex
        tableView.reloadData()
    }

}
