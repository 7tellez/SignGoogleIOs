//
//  ViewController.swift
//  GoogleSign-Swift-Tutorial
//
//  Created by Aman Aggarwal on 30/09/18.
//  Copyright © 2018 Aman Aggarwal. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {

    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var btnGoogleSignIn:UIButton!
    
    
    
    
    //NOTA
    // todo esta en el AppDelegate ehi esta la mayor poarte de la logica
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //instancia del boton para el inicio de sesion
        btnGoogleSignIn.addTarget(self, action: #selector(signinUserUsingGoogle(_ :)), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // inicio de session implementando GIDSignIn del AppDelegate
    @objc func signinUserUsingGoogle(_ sender: UIButton) {
            
            if btnGoogleSignIn.title(for: .normal) == "Cerrar Sesion" {
                GIDSignIn.sharedInstance().signOut()
                lblTitle.text = "Google Login"
                btnGoogleSignIn.setTitle("Ingresar Con Google", for: .normal)
                btnGoogleSignIn.backgroundColor = UIColor.white

            } else {
                GIDSignIn.sharedInstance().delegate = self as! GIDSignInDelegate
                GIDSignIn.sharedInstance().uiDelegate = self
                GIDSignIn.sharedInstance().signIn()
            }
        }

        
        func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
            
            if let error = error {
                print("We have error sign in user == \(error.localizedDescription)")
            } else {
                if let gmailUser = user {
                    lblTitle.text = "Info:  \n\(gmailUser.profile.name!)\n \(gmailUser.profile.email!)"
    
                    btnGoogleSignIn.setTitle("Cerrar Sesion", for: .normal)
                    btnGoogleSignIn.backgroundColor = UIColor.gray
                }
            }
        }

}

