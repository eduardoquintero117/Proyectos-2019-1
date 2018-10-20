//
//  secondViewController.swift
//  nav
//
//  Created by Eduardo Quintero on 09/10/18.
//  Copyright © 2018 New X. All rights reserved.
//

import UIKit

class secondViewController: UIViewController{
    
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var usesrIdName: UILabel!
    @IBOutlet weak var pasword: UILabel!
    
    var usersTo = [User]()
    var cont = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nombre.text = usersTo[cont].name
        usesrIdName.text = usersTo[cont].userID
        pasword.text = usersTo[cont].pasword
        
        usersTo[cont].state = true
        
        UserDefaults.standard.set(try? PropertyListEncoder().encode(usersTo), forKey:"Users")
        //print("\(usersTo[cont])--------------------")
        
    }

    @IBAction func clouseSession(_ sender: UIButton) {
        usersTo[cont].state = false
        
        
        UserDefaults.standard.set(try? PropertyListEncoder().encode(usersTo), forKey:"Users")
        
    }
    
    
    

}
