//
//  helthRegisterViewController.swift
//  Fit India
//
//  Created by izone on 15/11/17.
//  Copyright © 2017 Sysboon Technologies. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
class helthRegisterViewController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var txtheight: UITextField!
    @IBOutlet weak var txtSugar: UITextField!
    @IBOutlet weak var txtweight: UITextField!
    @IBOutlet weak var txtPressur: UITextField!
    
    @IBOutlet weak var lblWeight: UILabel!
    @IBOutlet weak var lblheight: UILabel!
    @IBOutlet weak var lblsugar: UILabel!
    @IBOutlet weak var lblbpressur: UILabel!
    
    @IBOutlet weak var nextButtonOut: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        nextButtonOut.layer.cornerRadius = 8
         nextButtonOut.layer.backgroundColor = UIColor.orange.cgColor
        
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
    
    func textFieldDidEndEditing(_ textField: UITextField) {

        switch textField.tag {
        case 1:
            if txtheight.text == ""
            {
                lblheight.text = "Enter Height"
                print(txtheight.tag)
                
            }
            else
            {
                lblheight.text = ""
            }
            break
        case 2:
            if txtweight.text == ""
            {
                lblWeight.text = "Enter Weight"
                
            }
            
            else
            {
                lblWeight.text = ""
            }
            break
        case 3:
            if txtSugar.text == ""
            {
                lblsugar.text = "Enter Blood Sugar"
                
            }
            else
            {
               lblsugar.text = ""
            }
            break
        case 4:
            if txtPressur.text == ""
            {
                lblbpressur.text = "Enter Blood Pressur"
            }
            else
            {
                lblbpressur.text = ""
            }
            break
        default:
            break
        }
    }
    
    @IBAction func nextButton(_ sender: UIButton)
    {
       if txtPressur.text == "" || txtSugar.text == "" || txtweight.text == "" ||
        txtheight.text == ""
       {
        nextButtonOut.layer.backgroundColor = UIColor.gray.cgColor
           if txtheight.text == ""
              {
                 lblheight.text = "Enter Height"
                 print(txtheight.tag)
            
              }
         else
              {
                 lblheight.text = ""
              }
        if txtweight.text == ""
        {
            lblWeight.text = "Enter Weight"
            
        }
            
        else
        {
            lblWeight.text = ""
        }
        if txtSugar.text == ""
        {
            lblsugar.text = "Enter Blood Sugar"
            
        }
        else
        {
            lblsugar.text = ""
        }
        if txtPressur.text == ""
        {
            lblbpressur.text = "Enter Blood Pressur"
        }
        else
        {
            lblbpressur.text = ""
        }
       }
        else
       {
        nextButtonOut.layer.backgroundColor = UIColor.orange.cgColor
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let setpass = storyBoard.instantiateViewController(withIdentifier: "setpassUserViewController") as! setpassUserViewController
        self.present(setpass, animated: true, completion: nil)
        
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }

    @IBAction func navRgstr(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let setpass = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.present(setpass, animated: true, completion: nil)
        
    }
    
}
