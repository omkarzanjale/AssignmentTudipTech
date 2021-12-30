//
//  HomeViewController.swift
//  AssignmentTudipTech
//
//  Created by Mac on 30/12/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    var users = [User]()

    @IBOutlet weak var usersTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var noInternetLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        noInternetLogo.isHidden = true
        usersTableView.tableFooterView = UIView()
        self.usersTableView.isHidden = true
        apiData()
    }
    
    private func apiData() {
        APICall().getAPIData { _ in
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.hidesWhenStopped = true
                self.noInternetLogo.isHidden = false
            }
        } complisherHandler: { (users) in
            self.users = users
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.hidesWhenStopped = true
                self.usersTableView.isHidden = false
                self.usersTableView.reloadData()
            }
        }

    }
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = users[indexPath.row]
        if let cell = usersTableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as? UserTableViewCell {
            cell.nameLabel.text = user.name
            cell.emailLabel.text = user.email
            cell.companyNameLabel.text = user.company.name
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}
