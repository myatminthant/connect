//
//  UserController.swift
//  Connect
//
//  Created by MAC on 20/08/2021.
//

import UIKit

class UserController: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
         
        title = "Available Users"
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
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
