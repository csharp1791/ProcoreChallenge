//
//  PullRequestsDiffsVC.swift
//  ProcoreChallenge
//
//  Created by Clifford Sharp on 10/23/17.
//  Copyright © 2017 csharpTech. All rights reserved.
//

import UIKit

class PullRequestsDiffsVC: UIViewController {
    var pullRequestItem: PullRequest?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpBackButton()
        
        // TODO: - for testing only
        if let element = pullRequestItem?.diff_url {
            print("Deff url: \(element)")
        }
    }
    
    // MARK: - Set up Back Button on navbar
    func setUpBackButton() {
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.goBack))
        navigationItem.leftBarButtonItem = backButton
        navigationItem.backBarButtonItem?.setTitleTextAttributes([NSAttributedStringKey.font: UIFont(name: "Helvetica Nueue", size: 12)!], for: UIControlState.normal)
        navigationItem.title = "Pull Request Diff's"
    }
    
    @objc func goBack() {
        dismiss(animated: true, completion: nil)
    }
}
