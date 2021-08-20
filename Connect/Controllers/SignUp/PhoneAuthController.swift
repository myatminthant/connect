//
//  PhoneAuthController.swift
//  Connect
//
//  Created by Lin Myat on 20/08/2021.
//

import UIKit
import FirebaseAuth


class PhoneAuthController: UIViewController {

    @IBOutlet weak var phoneNumberField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func sendCodeTap(_ sender: UIButton) {
        guard let phoneNumber = phoneNumberField.text,
              phoneNumber != "" else { return }
        phoneAuth(phoneNumber: phoneNumber)
    }
    
    func phoneAuth(phoneNumber: String) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
              if let error = error {
                print(error.localizedDescription)
              }else {
                if let verificationID = verificationID {
                    let vc = AuthCodeController()
                    vc.verificationID = verificationID
            //        vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true, completion: nil)
                }
            }
        }
    }
}
