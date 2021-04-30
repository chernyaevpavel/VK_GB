//
//  FillFakeData.swift
//  VK_GB
//
//  Created by Павел Черняев on 28.04.2021.
import Foundation

struct FillFakeData {
    
    var userGroup: [Group] = []
    
    func fillUserGroup(arr: inout [Group]) {
        //TODO delprint
//        print(#function)
        var group: Group
        group = Group(name: "Внедорожники64", subjectMater: .auto, countUser: 82, image: "auto")
        arr.append(group)
        group = Group(name: "Самодел", subjectMater: .homeDistil, countUser: 3, image: "samogon")
        arr.append(group)
        group = Group(name: "Комедии СССР", subjectMater: .movie, countUser: 154, image: nil)
        arr.append(group)
        group = Group(name: "Велотуризм России", subjectMater: .travel, countUser: 546, image: "bike")
        arr.append(group)
        group = Group(name: "Рыбалка в Саратове", subjectMater: .fishing, countUser: 2548, image: "fish")
        arr.append(group)        
        
//        for i in 0...500 {
//            group = Group(name: "Группа \(i)", subjectMater: .fishing, countUser: i, image: "fish")
//            arr.append(group)
//        }
    }
    
    
    func fillGlobalGroup(arr: inout [Group])  {
        //TODO delprint
//        print(#function)
//        sleep(5)
        var group: Group
        for i in 0...50 {
            group = Group(name: "Глобальная группа \(i)", subjectMater: .fishing, countUser: i, image: "fish")
            arr.append(group)
        }
    }
    
    func flllFriend(arr: inout [Friend]) {
        //print(#function)
        var friend: Friend
        var photos = ["dog1", "dog2", "dog3", "dog4", "dog5", "dog6", "dog7", "dog8"]
        friend = Friend(name: "Собакевич Дог Шарикович", avatar: "dog_avatar", status: .onLine, photos: photos)
        arr.append(friend)
        
        
        photos = ["cat1", "cat2", "cat3", "cat4", "cat5", "cat6", "cat7", "cat8", "cat9", "cat10", "cat11", "cat12"]
        friend = Friend(name: "Котейка Мурлыкович", avatar: "cat_avatar", status: .offLine, photos: photos)
        arr.append(friend)
        
        photos = ["dima1", "dima2", "dima3"]
        friend = Friend(name: "Сосед Диман", avatar: "dima_avatar", status: .offLine, photos: photos)
        arr.append(friend)
        
        
        
    }
}
