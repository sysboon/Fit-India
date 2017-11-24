//
//  registerUserViewController.swift
//  Fit India
//
//  Created by izone on 14/11/17.
//  Copyright © 2017 Sysboon Technologies. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
class registerUserViewController: UIViewController,UIPickerViewDelegate , UIPickerViewDataSource,UITextFieldDelegate,UIScrollViewDelegate
{
    
    
    
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var txtmobile: UITextField!
    @IBOutlet weak var txtdistrict: UITextField!
    @IBOutlet weak var txtname: UITextField!
    @IBOutlet weak var txtemailid: UITextField!
    @IBOutlet weak var txtstate: UITextField!
    
   
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var mainSubview: UIView!
    @IBOutlet weak var Datepick: UIDatePicker!
    @IBOutlet var maritalPicker: UIPickerView!
    @IBOutlet var subDate: UIView!
    
    @IBOutlet weak var maritalTxt: UITextField!
    @IBOutlet weak var txtdob: UITextField!
   
    @IBOutlet weak var txtGender: UITextField!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblDob: UILabel!
    @IBOutlet weak var lblDistrict: UILabel!
    @IBOutlet weak var lblemail: UILabel!
    @IBOutlet weak var lblstate: UILabel!
    @IBOutlet weak var lblmob: UILabel!
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var lblmerital: UILabel!
    
    var maritaldetails = [String]()
    var name = String()
    var emaild = String()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        maritaldetails = ["Merital status","Single","Married","Divorced","Widowed"]
        txtname.delegate = self
        txtdob.delegate = self
        
        txtdistrict.delegate = self
        txtstate.delegate = self
        txtemailid.delegate = self
        txtmobile.delegate = self
        maritalTxt.delegate = self
        
        maritalPicker.dataSource = self
        maritalPicker.delegate = self
        
       
        maritalTxt.text = maritaldetails[0]
        btnNext.backgroundColor = UIColor.orange
         btnNext.layer.cornerRadius = 8
        
        //gradient
        let colorBottom = UIColor(red: 220.0/255.0, green: 126.0/255.0, blue: 62.0/255.0, alpha: 1.0).cgColor
        let colorTop = UIColor(red: 255.0/255.0, green: 165.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [colorBottom,colorTop]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 0.1, y: 0.5)
        gradient.frame = btnNext.bounds
        gradient.cornerRadius = 8
        btnNext.layer.addSublayer(gradient)
  
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return maritaldetails.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return maritaldetails[row]
       }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        
       maritalTxt.text = maritaldetails[row]
    
       //maritalPicker.isHidden = true;
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        switch textField.tag {
        case 2:
            
               txtdob.inputView = self.subDate
               
               subDate.frame = CGRect (x: 0, y: 425, width: 375, height: self.view.frame.size.height/3)
              // scroll.addSubview(mainSubview)
               //view.addSubview(Datepick)
               //mainSubview.addSubview(Datepick)
               Datepick.backgroundColor = UIColor.gray
               Datepick.datePickerMode = UIDatePickerMode.date
               Datepick.addTarget(self, action: #selector(self.pickAct(_:)), for: UIControlEvents.valueChanged)
               //subDate.isHidden = true
            
            
            break
        case 7:
            print(textField.tag)
            maritalTxt.inputView = self.maritalPicker
           self.maritalPicker.frame = CGRect (x: 30, y: 260, width: 375, height: self.view.frame.size.height/3)
//            //self.mainSubview.addSubview(maritalPicker)
//            //scroll.addSubview(mainSubview)
//            view.addSubview(maritalPicker)
//            //maritalPicker.isHidden = false
            break
        case 8:
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
//important for input view
    
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
//    {
//        if textField.tag == 2
//        {
//
//            txtdob.inputView = self.subDate
//
//            subDate.frame = CGRect (x: 0, y: 425, width: 375, height: self.view.frame.size.height/3)
//            scroll.addSubview(mainSubview)
//            view.addSubview(Datepick)
//
//            Datepick.datePickerMode = UIDatePickerMode.date
//            Datepick.addTarget(self, action: #selector(self.pickAct(_:)), for: UIControlEvents.valueChanged)
//
//
//            subDate.isHidden = false
//            return false
//        }
//        else if textField.tag == 7
//        {
//
//            maritalTxt.inputView = maritalPicker
//            //scroll.addSubview(maritalPicker)
//            //self.maritalPicker.center = self.view.center
//            self.maritalPicker.frame = CGRect (x: 30, y: 260, width: 375, height: self.view.frame.size.height/3)
//            //self.mainSubview.addSubview(maritalPicker)
//
//            maritalPicker.isHidden = false
//        }
//
//        return false
//    }
    
    
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
     
        
         if textField.tag == 2 {
            
            subDate.isHidden = true
        }
        else if textField.tag == 7
        {
            maritalPicker.isHidden = true
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
    
    
    @IBAction func NextButton(_ sender: UIButton)
        
    {
       btnNext.layer.backgroundColor = UIColor.orange.cgColor
       
        // email validation
       let providedEmailAddress = txtemailid.text
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

        
        
        
       if txtname.text == "" || txtdob.text == "" || txtstate.text == "" ||  txtdistrict.text == "" || txtemailid.text == "" ||  txtmobile.text == "" || maritalTxt.text == "" || txtGender.text == ""
            {
                btnNext.layer.backgroundColor = UIColor.gray.cgColor
                
                if txtname.text == ""
                {
                    lblname.text = "Enter Name"
                    //print(txtheight.tag)
                    
                }
                else
                {
                    lblname.text = ""
                }
                
                if txtdob.text == ""
                {
                    lblDob.text = "Select dob"
                    
                }
                else
                {
                    lblDob.text = ""
                }
                if txtdistrict.text == ""
                {
                    lblDistrict.text = "Enter District"
                    
                }
                else
                {
                    lblDistrict.text = ""
                }
                if txtstate.text == ""
                {
                    lblstate.text = "Enter State"
                    
                }
                else
                {
                    lblstate.text = ""
                }
                if txtmobile.text?.count != 10
                {
                    lblmob.text = "Enter 10 Digits "
                    print("number valid")
                    
                }
                else {
                    lblmob.text = ""
                }
                if txtGender.text != "Female" || txtGender.text != "Male"
                {
                   lblGender.text = "Select M or F"
                }
                else
                {
                   lblGender.text = ""
                }
                if maritalTxt.text == "Merital status" || maritalTxt.text == ""
                {
                    lblmerital.text = "Select Merital Status"
                }
                else
                {
                    lblmerital.text = ""
                }
        
        }

           else
        
           {
            btnNext.layer.backgroundColor = UIColor.orange.cgColor
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let setpass = storyBoard.instantiateViewController(withIdentifier: "helthRegisterViewController") as! helthRegisterViewController
            self.present(setpass, animated: true, completion: nil)
            
      }
        
    }
    
    @IBAction func pickAct(_ sender: UIDatePicker)
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        self.txtdob.text = dateFormatter.string(from: Datepick.date)
    }
        
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view .endEditing(true)
        self.subDate.removeFromSuperview()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    @IBAction func GenderSeg(_ sender: UISegmentedControl)
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
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        switch textField.tag {
        case 1:
            if txtname.text == ""
            {
                lblname.text = "Enter Name"
                //print(txtheight.tag)
                
            }
            else
            {
                lblname.text = ""
            }
            break
        case 2:
            if txtdob.text == ""
            {
                lblDob.text = "Select dob"
                
            }
            else
            {
                lblDob.text = ""
            }
            break
        case 3:
            if txtdistrict.text == ""
            {
                lblDistrict.text = "Enter District"
                
            }
            else
            {
                lblDistrict.text = ""
            }
            break
        case 4:
            if txtstate.text == ""
            {
                lblstate.text = "Enter State"
                
            }
            else
            {
                lblstate.text = ""
            }
            break
        case 5:
            let providedEmailAddress = txtemailid.text
            let isEmailAddressValid = isValidEmailAddress(emailAddressString: providedEmailAddress!)
            if isEmailAddressValid
            {
                print("Email address is valid")
                lblemail.text = ""
            }
            else
            {
                lblemail.text = "Enter correct mailid"
            
            }

            break
            
        case 6:
            if txtmobile.text?.count != 10
            {
                lblmob.text = "Enter 10 Digits "
                print("number valid")
                
            }
            else {
                 lblmob.text = ""
            }
            break
            
        default:
            break
        }

    }
//    if txtname.text == "" || lblgender.text == "" ||   txtdob.text == "" || txtstate.text == "" ||  txtdistrict.text == "" || txtemailid.text == "" ||  txtmobile.text == "" || meritalTxt.text == "" ||
//    {
//
//    txtname.layer.borderColor = UIColor.red.cgColor
//    lblgender.layer.borderColor = UIColor.red.cgColor
//    txtdob.layer.borderColor = UIColor.red.cgColor
//    txtdistrict.layer.borderColor = UIColor.red.cgColor
//    txtstate.layer.borderColor = UIColor.red.cgColor
//    txtemailid.layer.borderColor = UIColor.red.cgColor
//    meritalTxt.layer.borderColor = UIColor.red.cgColor
//    }
//  else
//    {
//    let mainStoryboard:UIStoryboard = UIStoryboard(name:"Main",bundle:nil)
//    let helthregister = mainStoryboard.instantiateViewController(withIdentifier: "helthRegisterViewController") as! helthRegisterViewController
//    self.present(helthregister, animated: true, completion: nil)
//
    // let newFrontViewController = UINavigationController.init(rootViewController: desController)
    //revealViewController.pushFrontViewController(newFrontViewController, animated: true)
    
  //  let newViewController = storyBoard.instantiateViewController(withIdentifier: "newViewController") as! NewViewController
   // self.present(newViewController, animated: true, completion: nil)
    }
    


   
    
    

 


