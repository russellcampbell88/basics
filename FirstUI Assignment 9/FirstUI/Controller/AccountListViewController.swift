//
//  AccountListViewController.swift
//  FirstUI
//
//  Created by Russell Campbell on 10/31/23.
//

import UIKit

class AccountListViewController: UIViewController {
    
    
    //  We need 2 variables to grab and hold the data we're
    //  Passing from a previous screen.
    //
    //  We can use optionals to give the Strings a default
    //  value of nil. That said, we want to give the default
    //  value as the empty string
    
    //  To grab data to
    //  send to another screen, ys to ou need:
    
    //  Variables to send
    var emailData: String = ""
    var passwordData: String = ""
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Accounts List"
        
        setValuesToLabels()
    }
    
    //  MARK: ASSIGNMENT 9 -
    //  PROGRAMMATIC VIEW NAVIGATION
    @IBAction func signUpButtonClicked(_ sender: Any)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let accountsListVC = storyboard.instantiateViewController(withIdentifier: "AccountsListViewControllerID" ) as! AccountListViewController

        //  accountsListVC?.emailData = emailIDTextField.text ?? ""
        // --
        // --
        //  Push the new view onto the stack
        //  This is the actual line that takes us to the next screen.
        self.navigationController?.pushViewController( accountsListVC, animated: true )
        
        // another way to do it
    }
    
    
    //  MARK: ASSIGNMENT 9 - PASSING DATA TO ANOTHER SCREEN
    //  Functions to add values to the labels
    func setValuesToLabels() {
        emailLabel.text = emailData
        passwordLabel.text = passwordData
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
