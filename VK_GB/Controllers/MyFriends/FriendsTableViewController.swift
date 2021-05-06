//
//  FrindsTableViewController.swift
//  VK_GB
//
//  Created by Павел Черняев on 29.04.2021.
//

import UIKit

protocol SelectLetterProtocol: AnyObject {
    func selectLetter(_ letter: String)
}

class FriendsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SelectLetterProtocol {
    
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
        return filterFriendByLetter(arrFriens, letter).count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendViewCell.reuseID , for: indexPath) as! FriendViewCell
        let section = indexPath.section
        let index = indexPath.row
        
        let letter = arrFirstLetter[section]
        let friend = filterFriendByLetter(arrFriens, letter)[index]
        
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
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let letter = arrFirstLetter[indexPath.section]
        let friend: Friend = filterFriendByLetter(arrFriens, letter)[indexPath.row]
        friendPhotosCollectionViewController.friendPhotos = friend.photos
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrFirstLetter[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont(name: "System", size: 25)
    }
    
    func selectLetter(_ letter: String) {
        guard let section = arrFirstLetter.firstIndex(of: letter) else { return }
        let indexPath = IndexPath(row: 0, section: section)
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        
    }
    
    private func filterFriendByLetter(_ arr: [Friend], _ letter: String) -> [Friend] {
        return arr.filter({ String($0.name.first ?? "*") == letter })
    }
}
