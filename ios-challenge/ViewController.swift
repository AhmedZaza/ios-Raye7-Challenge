//
//  ViewController.swift
//  ios-challenge
//
//  Created by Mac on 6/10/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit
import Alamofire
// hold the titles and bodys in global lists
var titles_list = [String] ()
var bodys_list = [String] ()
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // using alamofire to make a request then recieve the response
        Alamofire.request(.GET, "https://jsonplaceholder.typicode.com/posts", parameters: nil)
            .responseJSON { response in
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(response.data!, options: .AllowFragments)
                    // take the whole json as an array then take the row you need , ie. title , body ,id ..
                    if let blogs = json as? [[String: AnyObject]] {
                        for blog in blogs {
                            if let title = blog["title"] as? String {
                                titles_list.append(title)
                            }
                            if let body = blog["body"] as? String {
                                bodys_list.append(body)
                            }
                        }
                    }
                }
                catch {
                    print("error serializing JSON Check Url or internet Connection and try again : \(error)")
                }
        }
        
        
    }
}

