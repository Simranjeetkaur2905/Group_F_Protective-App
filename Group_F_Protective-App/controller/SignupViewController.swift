//
//  SignupViewController.swift
//  Group_F_Protective-App
//
//  Created by Simran Chakkal on 2019-11-17.
//  Copyright © 2019 Simran Chakkal. All rights reserved.
//

import UIKit

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
    
    @IBAction func signupbutton(_ sender: Any) {
    }
    
    

}
