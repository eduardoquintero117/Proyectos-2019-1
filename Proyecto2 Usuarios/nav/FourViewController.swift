//
//  FourViewController.swift
//  nav
//
//  Created by Eduardo Quintero on 11/10/18.
//  Copyright © 2018 New X. All rights reserved.
//

import UIKit

class FourViewController: UIViewController {

    @IBOutlet weak var paciente: UILabel!
    
    var nombrePaciente = ""
    override func viewDidLoad() {
        super.viewDidLoad()
paciente.text = nombrePaciente
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
