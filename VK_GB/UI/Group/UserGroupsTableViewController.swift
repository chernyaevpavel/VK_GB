//
//  UserGroupsTableViewController.swift
//  VK_GB
//
//  Created by Павел Черняев on 28.04.2021.
//

import UIKit

class UserGroupsTableViewController: UITableViewController {
    var userGroups: [Group] = []
    var fillFakeData = FillFakeData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillFakeData.fillUserGroup(arr: &userGroups)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserGroupTableViewCell.reuseID, for: indexPath) as! UserGroupTableViewCell
        let index = indexPath.row
        let name = userGroups[index].name
        let description = userGroups[index].description
        var image: UIImage?
        if let named = userGroups[index].image {
            image = UIImage(named: named)
        } else {
            image = nil
        }
        cell.configure(name: name, description: description, image: image)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            userGroups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        guard segue.identifier == "AddGroup",
              let sourceController = segue.source as? GlobalGroupsTableViewController,
              let index = sourceController.tableView.indexPathForSelectedRow
        else {
            return
        }
        var group = sourceController.globalUserGroups[index.row]
        if !userGroups.contains(where: {$0.name == group.name}) {
            group.addUser()
            userGroups.append(group)
            tableView.reloadData()
        }
    }
}
