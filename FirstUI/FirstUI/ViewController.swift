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
        let emailID = emailIDTextField.text ?? "" // unwrap default (??) value as empty string ("")
        let password = passwordTextField.text ?? ""
        
        print("User ID = \(emailID)" )
        print("Password is = \(password)" )
    }
}

