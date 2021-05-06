//
//  GlobalGroupsTableViewController.swift
//  VK_GB
//
//  Created by Павел Черняев on 28.04.2021.
//

import UIKit

class GlobalGroupsTableViewController: UITableViewController {
    var globalUserGroups: [Group] = []
    let fillFakeData = FillFakeData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillFakeData.fillGlobalGroup(arr: &globalUserGroups)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return globalUserGroups.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserGroupTableViewCell.reuseID, for: indexPath) as! UserGroupTableViewCell
        let index = indexPath.row
        let name = globalUserGroups[index].name
        let description =  globalUserGroups[index].description
        var image: UIImage?
        if let named = globalUserGroups[index].image {
            image = UIImage(named: named)
        } else {
            image = nil
        }
        cell.configure(name: name, description: description, image: image)
        return cell
    }
}
