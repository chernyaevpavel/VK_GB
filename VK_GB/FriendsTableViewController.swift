//
//  FrindsTableViewController.swift
//  VK_GB
//
//  Created by Павел Черняев on 29.04.2021.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    var arrFriens: [Friend] = []
    let fillFakeData = FillFakeData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillFakeData.flllFriend(arr: &arrFriens)

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFriens.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendViewCell.reuseID , for: indexPath) as! FriendViewCell

        let index = indexPath.row
        let friend = arrFriens[index]
        
        var avatar: UIImage?
        if let named = friend.avatar {
            avatar = UIImage(named: named)
        } else {
            avatar = nil
        }
        cell.configure(name: friend.name, avatar: avatar, status: friend.status)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ShowFriendPhotos" else { return }
        guard let friendPhotosCollectionViewController: FriendPhotosCollectionViewController = segue.destination as? FriendPhotosCollectionViewController else { return }
        guard let index = tableView.indexPathForSelectedRow else { return }
        let friend: Friend = arrFriens[index.row]
        friendPhotosCollectionViewController.friendPhotos = friend.photos
    }
}
