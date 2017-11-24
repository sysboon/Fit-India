//
//  setpassUserViewController.swift
//  Fit India
//
//  Created by izone on 16/11/17.
//  Copyright © 2017 Sysboon Technologies. All rights reserved.
//

import UIKit

class setpassUserViewController: UIViewController,UITextFieldDelegate{

    
    @IBOutlet weak var txtusername: UITextField!
    @IBOutlet weak var txtconfirmpass: UITextField!
    @IBOutlet weak var txtpass: UITextField!
    @IBOutlet weak var lbluserName: UILabel!
    @IBOutlet weak var lblpassword: UILabel!
    @IBOutlet weak var lblconfirmPass: UILabel!
    
    @IBOutlet weak var registerButtonOut: UIButton!
    
    override func viewDidLoad() {
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
                lbluserName.text = "Enter Username"
                
                
            }
            else
            {
                lbluserName.text = ""
            }
            break
        case 2:
            if txtpass.text == ""
            {
                lblpassword.text = "Enter Password"
                
            }
                
            else
            {
                lblpassword.text = ""
            }
            break
        case 3:
            if txtconfirmpass.text == ""
            {
                lblconfirmPass.text = "Enter Confirm password"
                
            }
            else
            {
                lblconfirmPass.text = ""
            }
            break
        
        default:
            break
        }
    }
    
    
   
    @IBAction func registerAction(_ sender: UIButton)
    {
        if txtusername.text == "" || txtpass.text == "" || txtconfirmpass.text == ""
        {
            if txtusername.text == ""
            {
                lbluserName.text = "Enter Username"
                
                
            }
            else
            {
                lbluserName.text = ""
            }
//            if txtpass.text == ""
//            {
//                lblpassword.text = "Enter Password"
//
//            }
//            else
//            {
//                lblpassword.text = ""
//            }
//            if txtconfirmpass.text == ""
//            {
//                lblconfirmPass.text = "Enter Confirm password"
//            }
             if txtconfirmpass.text != txtpass.text
                {
                lblconfirmPass.text = "Password not matching"
                }
            else
               {
                lblconfirmPass.text = ""
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
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

    @IBAction func navRgstr(_ sender: UIBarButtonItem) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let setpass = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.present(setpass, animated: true, completion: nil)
        
    }
}
