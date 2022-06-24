

import UIKit

class NewEmojiTableViewController: UITableViewController {
    
    
    @IBOutlet weak var emojoTx: UITextField!
    
    @IBOutlet weak var nameTx: UIView!
        
    @IBOutlet weak var descriptionTx: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func textChanged(_ sender: UITextField) {
    }
    

    

}
