//
//  InboxViewController.swift
//  login-testing-proj
//
//  Created by Ashlei Mitchell on 4/22/22.
//

import UIKit

class InboxViewController: UIViewController, UITableViewDataSource {
    
    let collectionOfMessages = messages
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collectionOfMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let(message) = collectionOfMessages [indexPath.row]
        
        cell.textLabel?.text = message.subject
        return cell
    }
}
