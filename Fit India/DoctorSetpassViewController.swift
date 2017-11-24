//
//  DoctorSetpassViewController.swift
//  Fit India
//
//  Created by izone on 18/11/17.
//  Copyright © 2017 Sysboon Technologies. All rights reserved.
//

import UIKit

class DoctorSetpassViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var registerButtonOut: UIButton!
   
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblpass: UILabel!
    @IBOutlet weak var lblconfirmpass: UILabel!
    @IBOutlet weak var txtpass: UITextField!
    @IBOutlet weak var txtusername: UITextField!
    @IBOutlet weak var txtconfirmpass: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       
        registerButtonOut.layer.cornerRadius = 8
        //gradient
        let colorBottom = UIColor(red: 220.0/255.0, green: 126.0/255.0, blue: 62.0/255.0, alpha: 1.0).cgColor
        let colorTop = UIColor(red: 255.0/255.0, green: 165.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [colorBottom,colorTop]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 0.1, y: 0.5)
        gradient.frame = registerButtonOut.bounds
        gradient.cornerRadius = 8
        registerButtonOut.layer.addSublayer(gradient)
    }
    
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        switch textField.tag {
        case 1:
            if txtusername.text == ""
            {
                lblUsername.text = "Enter Username"
                
                
            }
            else
            {
                lblUsername.text = ""
            }
            break
        case 2:
            if txtpass.text == ""
            {
               lblpass.text = "Enter Password"
                
            }
                
            else
            {
                lblpass.text = ""
            }
            break
        case 3:
            if txtconfirmpass.text == ""
            {
                lblconfirmpass.text = "Enter Confirm password"
                
            }
            else
            {
                lblconfirmpass.text = ""
            }
            break
            
        default:
            break
        }
    }
    
    @IBAction func RegisterButtnActon(_ sender: UIButton) {
        
        if txtusername.text == "" || txtpass.text == "" || txtconfirmpass.text == ""
        {
            if txtusername.text == ""
            {
               lblUsername.text = "Enter Username"
                
                
            }
            else
            {
               lblUsername.text = ""
            }
            if txtconfirmpass.text != txtpass.text
            {
                lblconfirmpass.text = "Password not matching"
            }
            else
            {
                lblconfirmpass.text = ""
            }
            
        }
        else
        {
            registerButtonOut.layer.backgroundColor = UIColor.orange.cgColor
            
            
            //            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            //            let setpass = storyBoard.instantiateViewController(withIdentifier: "setpassUserViewController") as! setpassUserViewController
            //            self.present(setpass, animated: true, completion: nil)
            //
        }
        
        
    }
    
    @IBAction func navRegstr(_ sender: UIBarButtonItem) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let setpass = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.present(setpass, animated: true, completion: nil)
        
        
    }
    

}
