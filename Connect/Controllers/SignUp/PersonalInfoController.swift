//
//  PersonalInfoController.swift
//  Connect
//
//  Created by Lin Myat on 20/08/2021.
//

import UIKit
import Firebase
import FBSDKCoreKit
import FBSDKLoginKit

class PersonalInfoController: UIViewController {

    @IBOutlet weak var bgview: UIView!
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    var imagePicker: ImagePicker!
    let keyUid = "uid"
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
    }
    
    @IBAction func pickImage(_ sender: UITapGestureRecognizer) {
        self.imagePicker.present()
    }
    
    @IBAction func signUpTap(_ sender: UIButton) {
        guard let userName = usernameField.text,
              let email = emailField.text,
              userName != "",
              email != "" else { return }
        
        
    }

}
extension PersonalInfoController: ImagePickerDelegate {

    func didSelect(image: UIImage?) {
        self.userImg.image = image
    }
}
