//
//  DoctorExperienceViewController.swift
//  Fit India
//
//  Created by izone on 18/11/17.
//  Copyright © 2017 Sysboon Technologies. All rights reserved.
//

import UIKit

class DoctorExperienceViewController: UIViewController
{

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var txtSummary: UITextView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 8
        //gradient
        let colorBottom = UIColor(red: 220.0/255.0, green: 126.0/255.0, blue: 62.0/255.0, alpha: 1.0).cgColor
        let colorTop = UIColor(red: 255.0/255.0, green: 165.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [colorBottom,colorTop]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 0.1, y: 0.5)
        gradient.frame = nextButton.bounds
        gradient.cornerRadius = 8
      nextButton.layer.addSublayer(gradient)
        
    }

    
    @IBAction func navRegister(_ sender: UIBarButtonItem) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let setpass = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.present(setpass, animated: true, completion: nil)
        
    }
}
