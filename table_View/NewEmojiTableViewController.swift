

import UIKit

class NewEmojiTableViewController: UITableViewController {
    
    var emoji = EmojiModelData(emoji: "", title: "", subTitle: "", isFavorire: false)
    
    
  
 
    @IBOutlet weak var emojiTx: UITextField!
    
    @IBOutlet weak var nameTx: UITextField!
        
    @IBOutlet weak var descriptionTx: UITextField!
    
    
    @IBAction func textChanged(_ sender: UITextField) {
        upDateSaveButton()
    }
    
   
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        upDateSaveButton()
        updateUI()
    }
    
    private func upDateSaveButton() {
        let emojiText = emojiTx.text ?? ""
        let nameText = nameTx.text ?? ""
        let descriptionText = descriptionTx.text ?? ""
        
        saveButton.isEnabled = !emojiText.isEmpty && !nameText.isEmpty && !descriptionText.isEmpty
        
        
    }
    
    
    private func updateUI(){
        emojiTx.text = emoji.emoji
        nameTx.text = emoji.title
        descriptionTx.text = emoji.subTitle
        
    }
    
  
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveSegue" else { return }
        
        let emoji = emojiTx.text ?? ""
        let name = nameTx.text ?? ""
        let description = descriptionTx.text ?? ""
        
        self.emoji = EmojiModelData(emoji: emoji, title: name, subTitle: description, isFavorire: self.emoji.isFavorire)
    }
    

    

}
