//
//  ViewController.swift
//  FaceRecognitionProject
//
//  Created by MAKAN on 23.04.2020.
//  Copyright © 2020 YUNUS MAKAN. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInClicked(_ sender: Any) {
        
        let authContext = LAContext()
        
        var error : NSError?
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it you?") { (success, error) in
                if success == true {
                    //successfulwith
                    DispatchQueue.main.async {
                        
                self.performSegue(withIdentifier: "to2VC", sender: nil)
        }
                }else{
                    DispatchQueue.main.async {
                        
                    
                        self.resultLabel.text = "ERROR!"
                        
                    }
                }
            }
            
            
            
        }
    }
    
}

