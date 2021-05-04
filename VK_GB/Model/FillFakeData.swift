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
        
        var photos = [LikePhoto("dog1", 5), LikePhoto("dog2", 0), LikePhoto("dog3", 3), LikePhoto("dog4", 15), LikePhoto("dog5", 5),
                      LikePhoto("dog6", 1), LikePhoto("dog7", 8), LikePhoto("dog8", 7)]
        
        friend = Friend(name: "Собакевич Дог Шарикович", avatar: "dog_avatar", status: .onLine, photos: photos)
        arr.append(friend)
        
        
        photos = [LikePhoto("cat1", 0), LikePhoto("cat2", 0), LikePhoto("cat3", 0), LikePhoto("cat4", 0), LikePhoto("cat5", 0), LikePhoto("cat6", 0), LikePhoto("cat7", 0), LikePhoto("cat8", 0), LikePhoto("cat9", 0), LikePhoto("cat10", 0), LikePhoto("cat11", 0), LikePhoto("cat12", 0)]
        friend = Friend(name: "Котейка Мурлыкович", avatar: "cat_avatar", status: .offLine, photos: photos)
        arr.append(friend)
        
        photos = [LikePhoto("dima1", 0), LikePhoto("dima2", 0), LikePhoto("dima3", 0)]
        friend = Friend(name: "Сосед Диман", avatar: "dima_avatar", status: .offLine, photos: photos)
        arr.append(friend)
        
        
        
    }
}
