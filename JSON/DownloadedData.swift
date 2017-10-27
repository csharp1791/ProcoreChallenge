//
//  DownloadedData.swift
//  ProcoreChallenge
//
//  Created by Clifford Sharp on 10/24/17.
//  Copyright © 2017 csharpTech. All rights reserved.
//

import UIKit

struct PullRequestURL: Codable {
    var url: String
    var id: Int
}

struct PullRequest: Codable {
    var title: String
    var state: String
    var number: Int
    var diff_url: String
}

