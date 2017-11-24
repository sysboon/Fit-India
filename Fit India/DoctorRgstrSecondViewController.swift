//
//  DoctorRgstrSecondViewController.swift
//  Fit India
//
//  Created by izone on 18/11/17.
//  Copyright © 2017 Sysboon Technologies. All rights reserved.
//

import UIKit

class DoctorRgstrSecondViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var subDatepick: UIView!
    @IBOutlet weak var datepickerOut: UIDatePicker!
    @IBOutlet weak var NextBtnOut: UIButton!
    
    @IBOutlet weak var txtRgnumber: UITextField!
    @IBOutlet weak var txtRgCouncil: UITextField!
    @IBOutlet weak var txtRgDate: UITextField!
    
    
    @IBOutlet weak var lblRgDate: UILabel!
    @IBOutlet weak var lblRgCouncil: UILabel!
    @IBOutlet weak var lblRgnumber: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

      NextBtnOut.layer.cornerRadius = 8
        
        //gradient
        let colorBottom = UIColor(red: 220.0/255.0, green: 126.0/255.0, blue: 62.0/255.0, alpha: 1.0).cgColor
        let colorTop = UIColor(red: 255.0/255.0, green: 165.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [colorBottom,colorTop]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 0.1, y: 0.5)
        gradient.frame = NextBtnOut.bounds
        gradient.cornerRadius = 8
       NextBtnOut.layer.addSublayer(gradient)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        switch textField.tag {
        case 1:
            if txtRgnumber.text == ""
            {
                lblRgnumber.text = "Enter Registration Number"
                
            }
            else
            {
                lblRgnumber.text = ""
            }
            break
        case 2:
            if txtRgCouncil.text == ""
            {
                lblRgCouncil.text = "Enter Registerd Council"
                
            }
                
            else
            {
                lblRgCouncil.text = ""
            }
            break
        case 3:
            if txtRgDate.text == ""
            {
                lblRgDate.text = "Enter Registration Date "
                
            }
            else
            {
                lblRgDate.text = ""
            }
            break
       
        default:
            break
        }
    }
    
    @IBAction func DatepickerAction(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        self.txtRgDate.text = dateFormatter.string(from: datepickerOut.date)
        
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
       
            if textField.tag == 3
            {
            txtRgDate.inputView = self.subDatepick
           // subDatepick.frame = CGRect (x: 0, y: 425, width: 375, height: self.view.frame.size.height/3)
            datepickerOut.backgroundColor = UIColor.gray
            datepickerOut.datePickerMode = UIDatePickerMode.date
            datepickerOut.addTarget(self, action: #selector(self.DatepickerAction(_:)), for: UIControlEvents.valueChanged)
        }
            
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    @IBAction func NextBtnAction(_ sender: UIButton)
    {
        if txtRgnumber.text == "" || txtRgCouncil.text == "" ||  txtRgDate.text == ""
        {
            NextBtnOut.layer.backgroundColor = UIColor.gray.cgColor
            
            if txtRgnumber.text == ""
            {
                lblRgnumber.text = "Enter Registration Number"
                
            }
            else
            {
                lblRgnumber.text = ""
            }
            
            if txtRgCouncil.text == ""
            {
                lblRgCouncil.text = "Enter Registerd Council"
                
            }
                
            else
            {
                lblRgCouncil.text = ""
            }
            if txtRgDate.text == ""
            {
                lblRgDate.text = "Enter Registration Date "
                
            }
            else
            {
                lblRgDate.text = ""
            }
        }
            
        else
            
        {
            NextBtnOut.layer.backgroundColor = UIColor.orange.cgColor
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let setpass = storyBoard.instantiateViewController(withIdentifier: "chooseSpecialityViewController") as! chooseSpecialityViewController
            self.present(setpass, animated: true, completion: nil)
            
        }
        
    }
    
    @IBAction func navRgsr(_ sender: UIBarButtonItem) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let setpass = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.present(setpass, animated: true, completion: nil)
        
    }
    
}
