//
//  ViewController.swift
//  Fit India
//
//  Created by izone on 11/11/17.
//  Copyright © 2017 Sysboon Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var iamuser: UIButton!
    @IBOutlet weak var iamDoctor: UIButton!
    
    @IBOutlet weak var loginB: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.iamDoctor.isHidden = true
        self.iamuser.isHidden = true
        
        iamuser.layer.cornerRadius = 6
        iamuser.layer.borderWidth = 1
        iamuser.layer.borderColor = UIColor.black.cgColor
       
       iamDoctor.layer.cornerRadius = 5
       iamDoctor.layer.borderWidth = 1
        iamDoctor.layer.borderColor = UIColor.black.cgColor
        
        registerButton.layer.cornerRadius = 8
        registerButton.layer.borderWidth = 1
       registerButton.layer.borderColor = UIColor.blue.cgColor
        
        loginB.layer.cornerRadius = 8
        loginB.layer.backgroundColor = UIColor.orange.cgColor
        //loginB.layer.backgroundColor = UIColor.orange.cgColor
        
        //gradient
        let colorBottom = UIColor(red: 220.0/255.0, green: 126.0/255.0, blue: 62.0/255.0, alpha: 1.0).cgColor
        let colorTop = UIColor(red: 255.0/255.0, green: 165.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [colorBottom,colorTop]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 0.1, y: 0.5)
        gradient.frame = loginB.bounds
        gradient.cornerRadius = 8
        loginB.layer.addSublayer(gradient)
        
        
        
        
        print("fit india")
      
    }

   
    @IBAction func RegisterB(_ sender: Any)
    {
        self.registerButton.isHidden = true
        self.iamDoctor.isHidden = false
        self.iamuser.isHidden = false
    }
    
    
//    let gradient = CAGradientLayer()
//
//    gradient.frame = loginb.bounds
//    gradient.colors = [UIColor.white.cgColor, UIColor.black.cgColor]
//
//    view.layer.insertSublayer(gradient, at: 0)

    
}

