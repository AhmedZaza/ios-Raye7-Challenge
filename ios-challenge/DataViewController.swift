//
//  DataViewController.swift
//  ios-challenge
//
//  Created by Mac on 6/10/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class DataViewController: UIViewController ,UITableViewDataSource ,UITableViewDelegate{
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // give the row estimated value
        tableView.estimatedRowHeight = 45
        // make the row flexible with the string length
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // return the minimum between the two lists to be the rows count
        if bodys_list.count < titles_list.count
        {
            return bodys_list.count
        }
        else
        {
            return titles_list.count
        }
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        // we need only one section
        return 1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell")
        // if the cell is null initialize it by default values
        if cell == nil
        {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        }
        // insert our data both the title and the body on one row.
        cell!.textLabel?.text = "Title : " + titles_list[indexPath.row] +
            "\nBody : " + bodys_list[indexPath.row]
        //to make the row flexible
        cell?.textLabel?.numberOfLines = 0
        return cell!
    }


}
