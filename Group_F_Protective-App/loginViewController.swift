//
//  loginViewController.swift
//  Group_F_Protective-App
//
//  Created by Simran Chakkal on 2019-11-18.
//  Copyright © 2019 Simran Chakkal. All rights reserved.
//

import UIKit

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func loginaction(_ sender: Any) {
        //validate text fields
        //signing in the user
    }
    
    
    
}
