//
//  NewEmojiTableViewController.swift
//  table_View
//
//  Created by Macbook on 20.06.22.
//

import UIKit

class NewEmojiTableViewController: UITableViewController {
    
    
    @IBOutlet weak var emojoTx: UITextField!
    
    @IBOutlet weak var nameTx: UIView!
        
    @IBOutlet weak var descriptionTx: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 0
    }

    

}
