//
//  PullRequestsTVCell.swift
//  ProcoreChallenge
//
//  Created by Clifford Sharp on 10/23/17.
//  Copyright © 2017 csharpTech. All rights reserved.
//

import UIKit

class PullRequestsTVCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var num: UILabel!
    
    func title(name: String) {
       title.text = name
    }

    func state(name: String) {
        state.text = name
    }

    func num(name: Int) {
        num.text = String(name)
    }
}
