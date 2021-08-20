//
//  AuthCodeController.swift
//  Connect
//
//  Created by Lin Myat on 20/08/2021.
//
 
import UIKit
import FirebaseAuth

class AuthCodeController: UIViewController {

    @IBOutlet weak var codeField: UITextField!
    
    var verificationID = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func continueToSignUpTap(_ sender: UIButton) {
        guard let verificationCode = codeField.text, verificationCode != "" else {return}
       enterCode(verificationCode: verificationCode)
    }
    

    func enterCode(verificationCode: String) {
        
        let credential = PhoneAuthProvider.provider().credential(
          withVerificationID: verificationID,
          verificationCode: verificationCode)
        Auth.auth().signIn(with: credential) { authResult, error in
            if let error = error {
                print(error.localizedDescription)
            }else {
                let userID = authResult?.user.uid
                UserDefaults.standard.set(userID, forKey: "UserID")
                self.present(PersonalInfoController(), animated: true, completion: nil)
            }
        }
    }
}
