//
//  AuthorizationViewController.swift
//  ApepsKPI
//
//  Created by Игорь on 13.01.2018.
//  Copyright © 2018 igor. All rights reserved.
//

import UIKit

class AuthorizationViewController: UIViewController, AuthorizationView {
    
    var presenter: AuthorizationPresentation!
    
    @IBOutlet weak var studentSwitchButton: UIButton!
    @IBOutlet weak var teacherSwitchButton: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func studentButtonTouched(_ sender: UIButton) {
        teacherSwitchButton.isSelected = false
        sender.isSelected = true
    }
    
    @IBAction func teacherButtonTouched(_ sender: UIButton) {
        studentSwitchButton.isSelected = false
        sender.isSelected = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showWrongCredentialsAllert() {
        
    }
    
    func setViews() {
        
        studentButtonTouched(studentSwitchButton)
        
        emailTextField.placeholder = "authorization_placeholder_email".localized()
        emailTextField.leftView = UIView.init(frame: CGRect(x: 0, y: 0, width: 18, height: 20))
        emailTextField.leftViewMode = .always
        if let placeholder = emailTextField.placeholder {
            emailTextField.attributedPlaceholder = NSAttributedString(string:placeholder, attributes: [NSAttributedStringKey.foregroundColor: UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.4)])
        }
        
        passwordTextField.placeholder = "authorization_placeholder_password".localized()
        passwordTextField.leftView = UIView.init(frame: CGRect(x: 0, y: 0, width: 18, height: 20))
        passwordTextField.leftViewMode = .always
        if let placeholder = passwordTextField.placeholder {
            passwordTextField.attributedPlaceholder = NSAttributedString(string:placeholder, attributes: [NSAttributedStringKey.foregroundColor: UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.4)])
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
