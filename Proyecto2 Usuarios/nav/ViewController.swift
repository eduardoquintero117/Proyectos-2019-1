//
//  ViewController.swift
//  nav
//
//  Created by Eduardo Quintero on 09/10/18.
//  Copyright © 2018 New X. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var usuarioName: UITextField!
    @IBOutlet weak var pasword: UITextField!
    var usersTo = [User]()
    var cont = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let data = UserDefaults.standard.value(forKey:"Users") as? Data {
            let temp = try? PropertyListDecoder().decode(Array<User>.self, from: data)
            print("------------")
            
            usersTo = temp!
            print(usersTo)
            print("------------")
        }
        
        
        for i in usersTo{
            if i.state == true {
                usuarioName.text = i.userID
                pasword.text = i.pasword
                
            }
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "vista2"{
            
            let destino = segue.destination as! secondViewController
            destino.usersTo = usersTo
            destino.cont = cont
        }
        
        if segue.identifier == "vista3"{
            
            let destino = segue.destination as! ThirtViewController
            destino.usersTo = usersTo
            
        }
        
    }
    
    @IBAction func unwindToUno(_ segue: UIStoryboardSegue) {
        if segue.source is secondViewController{
            viewDidLoad()
            usuarioName.text = ""
            pasword.text = ""
            
        }
        
    }
    
    @IBAction func iniciosesion(_ sender: UIButton) {
        
        for i in usersTo {
            if(i.state == true){
                 if (i.userID == usuarioName.text! && i.pasword == pasword.text!){
                    
                     }else{
                    
                     aviso(evento: "Cuenta abierta", mensaje: "Hay una sesion abierta para poder ingresar en otra debes cerrar la sesion primero")
                     return
                   }
            }
        }
        
        cont = 0
        var bloqueo = false
        for i in usersTo{
            if (i.userID == usuarioName.text! || i.pasword == pasword.text!){
                bloqueo = true
            }
            if (i.userID == usuarioName.text! && i.pasword == pasword.text!){
                
                self.performSegue(withIdentifier: "vista2", sender: self)
                return
                
            }
            cont += 1
        }
        if bloqueo{
        
            aviso(evento: "", mensaje: "El usuario o la contraseña son incorrectos")
            
        }else{
            aviso(evento: "Registrate", mensaje: "No existe esa cuenta")
        }
    }
    
    func aviso(evento:String, mensaje: String) {
        let alerta = UIAlertController(title: evento, message: mensaje, preferredStyle: .alert)
        let ok = UIAlertAction(title: "ok", style: .default) { (action) in
            
        }
        alerta.addAction(ok)
        
        
        present(alerta, animated: true, completion: nil)
        
    }

}

