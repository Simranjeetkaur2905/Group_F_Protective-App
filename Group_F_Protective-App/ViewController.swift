//
//  ViewController.swift
//  Group_F_Protective-App
//
//  Created by Simran Chakkal on 2019-11-18.
//  Copyright © 2019 Simran Chakkal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet var signup: UIButton!
    
    @IBOutlet var login: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
setUpElements()
        // Do any additional setup after loading the view.
    }
    func setUpElements() {
         
         Utilities.styleFilledButton(signup)
         Utilities.styleHollowButton(login)
         
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
