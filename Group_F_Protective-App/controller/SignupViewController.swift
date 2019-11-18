//
//  SignupViewController.swift
//  Group_F_Protective-App
//
//  Created by Simran Chakkal on 2019-11-17.
//  Copyright © 2019 Simran Chakkal. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class SignupViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var Email: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    
    @IBOutlet weak var signup: UIButton!
    
    @IBOutlet weak var error: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
         setUpElements()
    }
    func setUpElements() {
    
        // Hide the error label
        error.alpha = 0
    
        // Style the elements
        Utilities.styleTextField(firstName)
        Utilities.styleTextField(lastName)
        Utilities.styleTextField(Email)
        Utilities.styleTextField(Password)
        Utilities.styleFilledButton(signup)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    // check the fields and validate that the data is correct. If everything is correct, this method
    func validateFields()-> String? {
        // check that all fields are filled in
        if firstName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                   lastName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                   Email.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                   Password.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
                   
                   return "Please fill in all fields."
               }
               
               // Check if the password is secure
               let cleanedPassword = Password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
               
               if Utilities.isPasswordValid(cleanedPassword) == false {
                   // Password isn't secure enough
                   return "Please make sure your password is at least 8 characters, contains a special character and a number."
               }
        return nil
    }
    @IBAction func signupbutton(_ sender: Any) {
        //validate the fields
        let error = validateFields()
               
               if error != nil {
                   
                   // There's something wrong with the fields, show error message
                   showError(error!)
               }
               else {
                   
                   // Create cleaned versions of the data
                   let firstname = firstName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                   let lastname = lastName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                   let email = Email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                   let password = Password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                   
        // create user
 Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                // Check for errors
                if err != nil {
                    
                    // There was an error creating the user
                    self.showError("Error creating user")
                }
                else {
                    
                    // User was created successfully, now store the first name and last name
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["firstname":firstname, "lastname":lastname, "uid": result!.user.uid ]) { (error) in

                        if error != nil {
                            // Show error message
                            self.showError("Error saving user data")
                        }
                    }
                    
                    // Transition to the home screen
                    self.transitionToHome()
                }
                
            }
        }
    }
    func showError(_ message:String) {
               
               error.text = message
               error.alpha = 1
           }
     func transitionToHome() {
            
            let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.HomeViewController) as? HomeViewController
            
            view.window?.rootViewController = homeViewController
            view.window?.makeKeyAndVisible()
            
        }
        
   }
