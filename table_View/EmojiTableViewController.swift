//
//  EmojiTableViewController.swift
//  table_View
//
//  Created by Macbook on 8.06.22.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    var objects = [
        EmojiModelData(emoji: "🐍", title: "snake", subTitle: "snakes is dangures", isFavorire: false),
        EmojiModelData(emoji: "🐖", title: "pig", subTitle: "pig is dirty", isFavorire: false),
        EmojiModelData(emoji: "🐕", title: "dog", subTitle: "dog is cute", isFavorire: false)
    
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.title = "cell"
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return objects.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emojiCell", for: indexPath) as! EmojiTableViewCell
        
        let object = objects[indexPath.row]
        
        cell.set(object: object)
        

        return cell
    }
    

    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedEmoji = objects.remove(at: sourceIndexPath.row)
        objects.insert(movedEmoji, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let done = doneAction(at: indexPath)
        let favorite = likeButton(at: indexPath)
            return UISwipeActionsConfiguration(actions: [done,favorite])
    }
    
    func doneAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "done") {
            (action,view,completion) in
            self.objects.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
            
        }
        action.backgroundColor = .systemGreen
        action.image = UIImage(systemName: "checkmark.circle")
        return action
    }
    
    func likeButton(at indexPath: IndexPath) -> UIContextualAction {
        var object = objects[indexPath.row]
        let action = UIContextualAction(style: .normal, title: "like") {
            (action, view, completion) in
            object.isFavorire = !object.isFavorire
            self.objects[indexPath.row] = object
            completion(true)
        }
        action.backgroundColor = object.isFavorire ? .systemPurple : .systemCyan
        action.image = UIImage(systemName: "heart")
        return action
    }

}
