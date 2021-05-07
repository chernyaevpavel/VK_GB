//
//  Group.swift
//  VK_GB
//
//  Created by Павел Черняев on 28.04.2021.
//

struct Group {
    var name: String
    let subjectMater: SubjectMatter
    private(set) var countUser: Int
    var image: String?
    var description: String {
        subjectMater.rawValue + ", " + String(countUser) + " участников"
    }
    
    mutating func addUser(count: Int = 1) {
        countUser += count
    }
    
    mutating func removeUser(count: Int = 1) {
        if count <= countUser {
            countUser -= count
        }
    }
}
