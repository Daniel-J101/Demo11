//
//  ViewController.swift
//  ClassDemo11
//
//  Created by Joe Miller on 7/22/22.
//

import UIKit

let choices = [
    "Simple UIAlertViewController",
    "UIAlertViewController with TextField",
    "UIAlertViewController with Multiple Buttons",
    "Standard UIActionSheet"
]

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    let textCellIdentifier:String = "TextCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let rowValue = choices[indexPath.row]
        
        switch indexPath.row {
        case 0:    // Simple
            let controller = UIAlertController(title: "Alert Controller", message: rowValue, preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            controller.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            present(controller, animated: true)
            
        case 1:    // with TextField
            
            let controller = UIAlertController(title: "Alert Controller", message: rowValue, preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            controller.addTextField(configurationHandler: {
                (textField:UITextField!) -> Void in
                textField.placeholder = "Enter your social security number"
            })
            controller.addAction(UIAlertAction(title: "Okay", style: .default) {
                (paramAction:UIAlertAction!) in
                if let textFieldArray = controller.textFields {
                    let textFields = textFieldArray as [UITextField]
                    let enteredText = textFields[0].text
                    print(enteredText!)
                }
            })
            present(controller, animated: true)

            
            
        case 2:    // with Multiple Buttons
            let controller = UIAlertController(title: "Alert Controller", message: rowValue, preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "One", style: .default, handler: nil))
            controller.addAction(UIAlertAction(title: "Two", style: .default, handler: nil))
            controller.addAction(UIAlertAction(title: "Three", style: .default, handler: nil))
            controller.addAction(UIAlertAction(title: "Four", style: .default, handler: nil))
            controller.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            present(controller, animated: true)
        case 3:    // Standard action sheet
            let controller = UIAlertController(title: "Action Sheet", message: rowValue, preferredStyle: .actionSheet)
            controller.addAction(UIAlertAction(title: "Okay", style: .default) {
                (action) in
                print("Accepted Data")
            })
            controller.addAction(UIAlertAction(title: "Cancel", style: .cancel) {
                (action) in
                print("Cancel Action")
            })
            controller.addAction(UIAlertAction(title: "Destroy", style: .destructive) {
                (action) in
                print("Destroyed Data")
            })
            present(controller, animated: true)

        default:
            print("Something went wrong")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath)
        let row = indexPath.row
        cell.textLabel?.text = choices[row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return choices.count
    }

}

