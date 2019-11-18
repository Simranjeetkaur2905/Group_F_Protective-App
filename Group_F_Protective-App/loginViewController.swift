//
//  loginViewController.swift
//  Group_F_Protective-App
//
//  Created by Simran Chakkal on 2019-11-18.
//  Copyright © 2019 Simran Chakkal. All rights reserved.
//

import UIKit
import  Firebase
import FirebaseAuth
import  FirebaseFirestore

class loginViewController: UIViewController {
    
    
    
    @IBOutlet var firstname: UITextField!
    
    
    @IBOutlet var password: UITextField!
    @IBOutlet var loginbutton: UIButton!
    
    @IBOutlet var errorlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    func setUpElements() {
         
    // Hide the error label
      errorlabel.alpha = 0
      
      // Style the elements
      Utilities.styleTextField(firstname)
      Utilities.styleTextField(password)
      Utilities.styleFilledButton(loginbutton)
         
     }


    
    @IBAction func loginaction(_ sender: Any) {
        
        // Create cleaned versions of the text field
        let email = firstname.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let Password = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: Password) { (result, error) in
            
            if error != nil {
                // Couldn't sign in
                self.errorlabel.text = error!.localizedDescription
                self.errorlabel.alpha = 1
            }
            else {
                
                let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.HomeViewController) as? HomeViewController
                
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
        
    }
    
    
    
}
