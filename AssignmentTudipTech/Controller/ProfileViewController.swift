//
//  ProfileViewController.swift
//  AssignmentTudipTech
//
//  Created by Mac on 30/12/21.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func saveBtnAction(_ sender: Any) {
    }
}
