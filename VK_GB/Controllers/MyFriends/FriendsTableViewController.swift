//
//  FrindsTableViewController.swift
//  VK_GB
//
//  Created by Павел Черняев on 29.04.2021.
//

import UIKit

protocol SelectedLetter {
    func selectLetter(_ letter: String)
}

class FriendsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SelectedLetter {
    
    var arrFriens: [Friend] = []
    var arrFirstLetter =  [String]()
    let fillFakeData = FillFakeData()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var letterControl: SelectLetterControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillFakeData.flllFriend(arr: &arrFriens)
        arrFirstLetter = fillFakeData.arrFirstChar(arrFriends: arrFriens)
        letterControl.arrLetters = arrFirstLetter
        letterControl.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrFirstLetter.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let letter = arrFirstLetter[section]
        let count = arrFriens.filter({ String($0.name.first ?? "*") == letter }).count
        return count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendViewCell.reuseID , for: indexPath) as! FriendViewCell
        let section = indexPath.section
        let index = indexPath.row
        let letter = arrFirstLetter[section]
        let friend = arrFriens.filter({ String($0.name.first ?? "*") == letter })[index]
        
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
    
    func selectLetter(_ letter: String) {
        guard let section = arrFirstLetter.firstIndex(of: letter) else { return }
        let indexPath = IndexPath(row: 0, section: section)
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
}
