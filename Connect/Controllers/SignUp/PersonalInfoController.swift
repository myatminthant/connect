//
//  PersonalInfoController.swift
//  Connect
//
//  Created by Lin Myat on 20/08/2021.
//

import UIKit
//import Firebase
import FirebaseDatabase
import FirebaseStorage

class PersonalInfoController: UIViewController {

    @IBOutlet weak var bgview: UIView!
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    var imagePicker: ImagePicker!
    let database = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        setupView()
    }
    
    func setupView() {
        bgview.layer.cornerRadius = bgview.frame.size.height / 2
        bgview.layer.shadowColor = UIColor.lightGray.cgColor
        bgview.layer.shadowRadius = 8
        bgview.layer.shadowOffset = CGSize(width: 0, height: 0)
        userImg.layer.cornerRadius = userImg.frame.size.height / 2
    }
    
    @IBAction func pickImage(_ sender: UITapGestureRecognizer) {
        self.imagePicker.present()
    }
    
    @IBAction func signUpTap(_ sender: UIButton) {
        guard let userName = usernameField.text,
              let email = emailField.text,
              let image = userImg.image,
              userName != "",
              email != "" else { return }
        uploadImage(image: image, name: userName, email: email, filePath: "images/profileImage")
    }

}

extension PersonalInfoController {
    func uploadImage(image: UIImage, name: String, email: String, filePath: String) {
        guard let imageData: Data = image.jpegData(compressionQuality: 1) else { return }
        let metaDataConfig = StorageMetadata()
        metaDataConfig.contentType = "image/jpg"
        let storageRef = Storage.storage().reference(withPath: filePath)
        storageRef.putData(imageData, metadata: metaDataConfig){ (metaData, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }

            storageRef.downloadURL(completion: { (url: URL?, error: Error?) in
                if let urlString = url?.absoluteString {
                    self.signUp(userInfo: User(dict: ["name" : name, "email": email, "image": urlString]))
                }
            })
        }
    }
    
    func signUp(userInfo: User) {
        guard let userID = UserDefaults.standard.string(forKey: "UserID") else { return }
        let userInfoDict = ["name": userInfo.name, "email": userInfo.email, "image": userInfo.image]
        let ref = database.child("users").child(userID)
        ref.setValue(userInfoDict, withCompletionBlock: { err, ref in
            if let error = err {
                print("userInfoDictionary was not saved: \(error.localizedDescription)")
            } else {
                let vc = UserController()
                let nav = UINavigationController(rootViewController: vc)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        })
    }
}

extension PersonalInfoController: ImagePickerDelegate { 
    func didSelect(image: UIImage?) {
        self.userImg.image = image
    }
}
