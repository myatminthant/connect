//
//  UserController.swift
//  Connect
//
//  Created by MAC on 20/08/2021.
//

import UIKit
import FirebaseDatabase

class UserController: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
         
        title = "Available Users"
        
        navigationController?.navigationBar.backgroundColor = .red
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
        fetchUserData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell else { return UITableViewCell() }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(ChatController(), animated: true)
    }
}

extension UserController {
    func fetchUserData() {
        let databaseRef = Database.database().reference()
        databaseRef.child("users").observe(.value) { snapshot in
            let currentUserID = UserDefaults.standard.string(forKey: "UserID")
            let snapshotValues = snapshot.children.allObjects
            print(snapshotValues) 
        }
    }
}
