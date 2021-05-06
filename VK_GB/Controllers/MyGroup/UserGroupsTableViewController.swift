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
//        cell.groupName.text = userGroups[index].name
//        cell.groupDescription.text = userGroups[index].subjectMater.rawValue + ", " + String(userGroups[index].countUser) + " участников"
//        //cell.groupImage = UIImage(named: userGroups[index].image)
//        let image = UIImage(named: userGroups[index].image)
//        cell.groupImage.image = image
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
        //если расскоментировать блок ниже, то в консоль падает ошибка... попробую разобраться, но позже
//        2021-04-29 20:37:33.452622+0400 VK_GB[29996:2311131] [Presentation] Presenting view controller <UIAlertController: 0x13001da00> from detached view controller <VK_GB.UserGroupsTableViewController: 0x12b62a6c0> is discouraged.
//        } else {
//            let alert = UIAlertController(title: "Ошибка", message: "Группа \(group.name), уже добавлена в ваши группы", preferredStyle: .alert)
//            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//            alert.addAction(action)
//            present(alert, animated: true, completion: nil)
//        }
    }

}
