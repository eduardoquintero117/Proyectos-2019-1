//
//  ThirtViewController.swift
//  nav
//
//  Created by Eduardo Quintero on 09/10/18.
//  Copyright © 2018 New X. All rights reserved.
//

import UIKit

class ThirtViewController: UIViewController {
    

    @IBOutlet weak var userRegistration: UITextField!
    @IBOutlet weak var nombreRegistration: UITextField!
    @IBOutlet weak var pasword1Registration: UITextField!
    @IBOutlet weak var pasword2Registration: UITextField!
    
   
    var usersTo = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    

    @IBAction func Registrar(_ sender: UIButton) {
        if(userRegistration.text == "" || nombreRegistration.text == "" || pasword1Registration.text == ""){
            //print("te falta informacion")
            
        }
        if(pasword1Registration.text == pasword2Registration.text && pasword1Registration.text != "" ){
            
            //se guardan las variables
            
            let defaults = UserDefaults.standard
            
             let newUser = User(name: nombreRegistration.text!, userID: userRegistration.text!, pasword: pasword1Registration.text!,state: false)
            usersTo.append(newUser)
            defaults.set(try? PropertyListEncoder().encode(usersTo), forKey:"Users")
            // te mada a la vista1
            performSegue(withIdentifier: "regreso", sender: self)
            
            
            
        }
        
    }
    

}
