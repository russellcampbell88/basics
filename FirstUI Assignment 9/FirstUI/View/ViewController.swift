//
//  ViewController.swift
//  FirstUI
//
//  Created by Russell Campbell on 10/30/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var screenLogoImageView: UIImageView!
    @IBOutlet weak var emailIDTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    //  viewDidLoad is called by the OS
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //  If you want to setup the initial UI, you can do it here
        setUpInitialUI()

    }

    func setUpInitialUI()
    {
        self.title = "Sign In"
        
        //  Programmatically alter UIKit Elements
        welcomeLabel.text = "First StoryBoard App"
        welcomeLabel.textColor = .white
        welcomeLabel.font = .systemFont( ofSize: 20 )
        
    }

    @IBAction func loginButtonTapped(_ sender: Any) 
    {
        print("Sign In button tapped.")
        
        //  Print whatever the user has typed in the
        //  field(s)
        //
        // unwrap default (??) value as empty string ("")
        let emailID = emailIDTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        print("User ID = \(emailID)" )
        print("Password is = \(password)" )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AccountsListSegue"
        {
            //  This is like asking, "if our destination has this identifier,"
            //  pass the data.
            if let accountsListViewController = segue.destination as? AccountListViewController {
                    let emailID = emailIDTextField.text ?? ""
                    let password = passwordTextField.text ?? ""
                //  Pass values into the variables we created to
                //  catch the data.
                accountsListViewController.emailData = emailID
                accountsListViewController.passwordData = password
            }
        }
    }
    
    /*override func performSegue(withIdentifier identifier: String, sender: Any?) {
        <#code#>
    }*/
}

