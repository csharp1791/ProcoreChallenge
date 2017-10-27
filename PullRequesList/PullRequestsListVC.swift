//
//  PullRequestsListVC.swift
//  ProcoreChallenge
//
//  Created by Clifford Sharp on 10/23/17.
//  Copyright © 2017 csharpTech. All rights reserved.
//

import UIKit

// TODO: put these string constants in a plist and localize them
fileprivate let DiffsSegueIdentifier = "DiffsSegue"
fileprivate let PullRequestsCellIdentifier = "PullRequestsCell"
fileprivate let TableViewHeaderText = "PULL REQUESTS LIST"
fileprivate let ScreenTitle = "PROCORE CHALLENGE"

var pullRequestGroup = [PullRequest]()
let tintColor =  UIColor(red: 242/255, green: 71/255, blue: 63/255, alpha: 1)

class PullRequestsListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = tintColor
        
        setUpTableViewHeader()
        
        self.navigationItem.title = ScreenTitle
        
        extractPullRequestInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    // MARK: - Set up TableView Header
    func setUpTableViewHeader() {
        let HEADER_HEIGHT: CGFloat = 55
        let viewInHeader = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: HEADER_HEIGHT))
        let labelInHeader = UILabel(frame: CGRect(x: 10, y: 10, width: 200, height: HEADER_HEIGHT))
        labelInHeader.text = TableViewHeaderText
        labelInHeader.textColor = UIColor.blue
        tableView.tableHeaderView?.frame.size = CGSize(width: tableView.frame.width, height: HEADER_HEIGHT)
        
        viewInHeader.addSubview(labelInHeader)
        tableView.tableHeaderView = viewInHeader
    }
    
    func extractPullRequestInfo() {
        let httpRequest = GithubRequest()
        httpRequest.httpGet(completionHandler: { (pullRequestList, error) in
            if let error = error {
                print("PullRequestListVC>extractRequestInfo: error calling httpGet for PullRequest")
                print(error)
                return
            }
            pullRequestGroup = pullRequestList
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == DiffsSegueIdentifier {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let navVC = segue.destination as! UINavigationController
                let diffsVC = navVC.viewControllers.first as! PullRequestsDiffsVC
                diffsVC.pullRequestItem = pullRequestGroup[indexPath.row]
            }
        }
    }
}

// MARK: - UITableView Protocols
extension PullRequestsListVC: UITableViewDataSource, UITableViewDelegate  {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pullRequestGroup.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PullRequestsTVCell = tableView.dequeueReusableCell(withIdentifier: PullRequestsCellIdentifier, for: indexPath) as! PullRequestsTVCell
        
        cell.title(name: pullRequestGroup[indexPath.row].title)
        cell.state(name: pullRequestGroup[indexPath.row].state)
        cell.num(name: pullRequestGroup[indexPath.row].number)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: DiffsSegueIdentifier, sender: nil)
     }
}


