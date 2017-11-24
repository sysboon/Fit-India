//
//  chooseSpecialityViewController.swift
//  Fit India
//
//  Created by izone on 18/11/17.
//  Copyright © 2017 Sysboon Technologies. All rights reserved.
//

import UIKit

class chooseSpecialityViewController: UIViewController,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource
    
{
var specialityDetails = [String]()
    
    @IBOutlet weak var lblError: UILabel!
    @IBOutlet var specialityPicker: UIPickerView!
    @IBOutlet weak var txtSpeciality: UITextField!
    
    @IBOutlet weak var txtOtherSpeciality: UITextField!
    
    @IBOutlet weak var lblOtherspecial: UILabel!
    @IBOutlet weak var nextButtonOut: UIButton!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        nextButtonOut.layer.cornerRadius = 8
      
        specialityDetails = ["Choose Speciality","Cardiology","Dental","Dermatology","Gynaecology","Endocrinology","Neurology","Oncology","Pediatry","Urology","Other"]
        txtSpeciality.text = specialityDetails[0]
        txtOtherSpeciality.isHidden = true
        //gradient
        let colorBottom = UIColor(red: 220.0/255.0, green: 126.0/255.0, blue: 62.0/255.0, alpha: 1.0).cgColor
        let colorTop = UIColor(red: 255.0/255.0, green: 165.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [colorBottom,colorTop]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 0.1, y: 0.5)
        gradient.frame = nextButtonOut.bounds
        gradient.cornerRadius = 8
        nextButtonOut.layer.addSublayer(gradient)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return specialityDetails.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print(specialityDetails[row])
        return specialityDetails[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        
       txtSpeciality.text = specialityDetails[row]
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
      if textField.tag == 1
      {
           txtSpeciality.inputView = self.specialityPicker

        }
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        if txtSpeciality.text == "" || txtSpeciality.text == "Choose Speciality"
        {
            lblError.text = "Choose your Speciality"
        }
        else
        {
            lblError.text = ""
        }
        if txtSpeciality.text == "Other" {
            txtOtherSpeciality.isHidden = false
        }
//        if txtOtherSpeciality.text! == ""
//        {
//            lblOtherspecial.text = "Enter your Speciality"
//        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }

  
    @IBAction func NextButtnAct(_ sender: UIButton)
    {
        if txtSpeciality.text! == "Other" && txtOtherSpeciality.text == ""
        {
            lblOtherspecial.text = "Enter your Speciality"
        }
        
        if txtSpeciality.text == "" || txtSpeciality.text == "Choose Speciality" || lblOtherspecial.text == "Enter your Speciality"
        {
        if txtSpeciality.text == "" || txtSpeciality.text == "Choose Speciality"
        {
            lblError.text = "Choose your Speciality"
        }
        else
        {
            lblError.text = ""
        }
            
        }
        else
        {
            nextButtonOut.layer.backgroundColor = UIColor.orange.cgColor
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let setpass = storyBoard.instantiateViewController(withIdentifier: "DoctorExperienceViewController") as! DoctorExperienceViewController
            self.present(setpass, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func navReg(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let setpass = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.present(setpass, animated: true, completion: nil)
        
    }
    
}
