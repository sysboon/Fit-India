//
//  DoctorRegistrationViewController.swift
//  Fit India
//
//  Created by izone on 17/11/17.
//  Copyright © 2017 Sysboon Technologies. All rights reserved.
//

import UIKit

class DoctorRegistrationViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var NextButtonOut: UIButton!
    
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblQualification: UILabel!
    @IBOutlet weak var lblDistrict: UILabel!
    @IBOutlet weak var lblState: UILabel!
    @IBOutlet weak var lblMobile: UILabel!
    @IBOutlet weak var lblEmailid: UILabel!
    
    
    
    @IBOutlet weak var txtGender: UITextField!
    @IBOutlet weak var txtMailid: UITextField!
    @IBOutlet weak var txtmobile: UITextField!
    @IBOutlet weak var txtState: UITextField!
    @IBOutlet weak var txtDistrict: UITextField!
    @IBOutlet weak var txtQualification: UITextField!
    @IBOutlet weak var txtname: UITextField!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        NextButtonOut.layer.cornerRadius = 8
        NextButtonOut.layer.backgroundColor = UIColor.orange.cgColor
        txtname.delegate = self
        txtQualification.delegate = self
        txtState.delegate = self
        txtmobile.delegate = self
        txtMailid.delegate = self
        //gradient
        let colorBottom = UIColor(red: 220.0/255.0, green: 126.0/255.0, blue: 62.0/255.0, alpha: 1.0).cgColor
        let colorTop = UIColor(red: 255.0/255.0, green: 165.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [colorBottom,colorTop]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 0.1, y: 0.5)
        gradient.frame = NextButtonOut.bounds
        gradient.cornerRadius = 8
        NextButtonOut.layer.addSublayer(gradient)
    }
   
    
    
    
   
    @IBAction func NextButtonAction(_ sender: UIButton)
    {
      
        
        NextButtonOut.layer.backgroundColor = UIColor.orange.cgColor
        
        // email validation
        let providedEmailAddress = txtMailid.text
        let isEmailAddressValid = isValidEmailAddress(emailAddressString: providedEmailAddress!)
        if isEmailAddressValid
        {
            print("Email address is valid")
            
        }
        else
        {
            
            let alertController = UIAlertController(title: "Required feild", message:
                "please enter mailid", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
            
        }
        
        
        
        
        if txtname.text == "" || txtQualification.text == "" ||  txtDistrict.text == "" || txtState.text == "" ||  txtmobile.text == "" || txtMailid.text == "" || txtGender.text == ""
        {
            NextButtonOut.layer.backgroundColor = UIColor.gray.cgColor
            
            if txtname.text == ""
            {
                lblName.text = "Enter Name"
                //print(txtheight.tag)
                
            }
            else
            {
                lblName.text = ""
            }
            if txtDistrict.text == ""
            {
                lblDistrict.text = "Enter District"
                
            }
            else
            {
                lblDistrict.text = ""
            }
            if txtState.text == ""
            {
                lblState.text = "Enter State"
                
            }
            else
            {
                lblState.text = ""
            }
            if txtmobile.text?.count != 10
            {
                lblMobile.text = "Enter 10 Digits "
                print("number valid")
                
            }
            else {
                lblMobile.text = ""
            }
            if txtGender.text != "Female" || txtGender.text != "Male"
            {
                lblGender.text = "Select M or F"
            }
            else
            {
                lblGender.text = ""
            }
            
        }
            
        else
            
        {
            NextButtonOut.layer.backgroundColor = UIColor.orange.cgColor
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let setpass = storyBoard.instantiateViewController(withIdentifier: "DoctorRgstrSecondViewController") as! DoctorRgstrSecondViewController
            self.present(setpass, animated: true, completion: nil)
            
        }
       
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        switch textField.tag {
        case 1:
            if txtname.text == ""
            {
                lblName.text = "Enter Name"
                //print(txtheight.tag)

            }
            else
            {
                lblName.text = ""
            }
            break
        case 2:
            if txtQualification.text == ""
            {
                lblQualification.text = "Enter Qualification"
                
            }
            else
            {
                lblQualification.text = ""
            }
            break
        case 3:
            if txtDistrict.text == ""
            {
                lblDistrict.text = "Enter District"

            }
            else
            {
                lblDistrict.text = ""
            }
            break
        case 4:
            if txtState.text == ""
            {
                lblState.text = "Enter State"

            }
            else
            {
                lblState.text = ""
            }
            break
        case 5:
            if txtmobile.text?.count != 10
            {
                lblMobile.text = "Enter 10 Digits "
                print("number valid")
                
            }
            else {
                lblMobile.text = ""
                 }
            break
        case 6:
            let providedEmailAddress = txtMailid.text
            let isEmailAddressValid = isValidEmailAddress(emailAddressString: providedEmailAddress!)
            if isEmailAddressValid
            {
                print("Email address is valid")
                lblEmailid.text = ""
            }
            else
            {
                lblEmailid.text = "Enter correct mailid"

            }
            break
        case 7:
            if txtGender.text != "Female" || txtGender.text != "Male"
            {
                lblGender.text = "Select M or F"
                
            }
            else
            {
                lblGender.text = ""
            }
            break
        default:
            break
        }
    }
    
    
    
    
    func isValidEmailAddress(emailAddressString: String) -> Bool
    {
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    @IBAction func GenderSegment(_ sender: UISegmentedControl)
    {
        switch sender.selectedSegmentIndex
        {
        case 0:
            txtGender.text = ""
            txtGender.text = "Male";
        case 1:
            txtGender.text = ""
            txtGender.text = "Female";
        default:
            break;
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    @IBAction func NavRgstr(_ sender: UIBarButtonItem) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let setpass = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.present(setpass, animated: true, completion: nil)
        
    }
    
    
    

}
