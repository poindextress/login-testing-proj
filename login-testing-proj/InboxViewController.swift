//
//  InboxViewController.swift
//  login-testing-proj
//
//  Created by Ashlei Mitchell on 4/22/22.
//

import UIKit

class InboxViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "viewTableCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:TableCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableCell
        
        let message = messages[indexPath.row]
        
        cell.labelSender.text = message.sender
        cell.labelSubject.text = message.subject
        cell.labelBody.text = message.body
        
        return cell
    }
}
