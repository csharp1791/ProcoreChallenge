//
//  GithubRequest.swift
//  ProcoreChallenge
//
//  Created by Clifford Sharp on 10/24/17.
//  Copyright © 2017 csharpTech. All rights reserved.
//

import UIKit

let endPoint = "https://api.github.com/repos/magicalpanda/MagicalRecord/pulls"

class GithubRequest {
    func httpGet(completionHandler: @escaping ([PullRequest], Error?) -> Void) {
        let sampleDataAddress = endPoint
        guard let url = URL(string: sampleDataAddress) else {
            // TODO: - get the class and method progrmmatically later
            print("GithubRequest>httpGet: error, did not receive data")
            return
        }
        // TODO: - This is quick and dirty - needs more error processing
        let jsonData = try! Data(contentsOf: url)
        let jsonDecoder = JSONDecoder()
        
        do {
            let pullRequest = try jsonDecoder.decode(Array<PullRequest>.self, from: jsonData)
            completionHandler(pullRequest, nil)
            
        } catch {
            print("GithubRequest>httpGet: error trying to convert data to JSON")
            print(error)
            completionHandler([], error)
        }
        
        // TODO: - for testing only
//        let firstPR = pullRequest?.first
//        if let title = firstPR?.title {
//            print("\(title)")
//        }
    }
}

