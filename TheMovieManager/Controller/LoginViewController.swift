//
//  LoginViewController.swift
//  TheMovieManager
//
//  Created by Owen LaRosa on 8/13/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginViaWebsiteButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        emailTextField.text = ""
        passwordTextField.text = ""
        

    }
    
    @IBAction func loginTapped(_ sender: UIButton) {

        TMDBClient.getRequestToken(completion: handleRequstTokenResponse(success:error:))
        
        //performSegue(withIdentifier: "completeLogin", sender: nil)
    }
    
    func handleRequstTokenResponse(success: Bool, error: Error?) {
        if success {
            print(TMDBClient.Auth.requestToken)
            
            DispatchQueue.main.sync {
                TMDBClient.login(username: self.emailTextField.text ?? "", password: self.passwordTextField.text ?? "", completion: handleLoginResponse(success:error:))
            }
        } else {
            print("get user token NOT successful")
        }
    }
    
    func handleLoginResponse(success: Bool, error: Error?) {
        if success {
            print("login successful")
            print(TMDBClient.Auth.requestToken)
            
            TMDBClient.createSession(completion: handleSessionResponse(success:error:))
        } else {
            print("login NOT valid failed with error as \(error!)")
            
        }
    }
    
    func handleSessionResponse(success: Bool, error: Error?) {
        if success {
            print("create session successful")
            print(TMDBClient.Auth.sessionId)
            
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "completeLogin", sender: nil)
            }
            
        } else {
            print("create session request failed \(error!)")
        }
    }
    
    @IBAction func loginViaWebsiteTapped() {
        TMDBClient.getRequestToken { (success, error) in
            if success {
                DispatchQueue.main.async {
                    UIApplication.shared.open(TMDBClient.Endpoints.webAuth.url, options: [:], completionHandler: nil)
                }
            }
        }
    }
    
}
