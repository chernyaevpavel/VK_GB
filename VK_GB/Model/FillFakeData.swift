//
//  FillFakeData.swift
//  VK_GB
//
//  Created by Павел Черняев on 28.04.2021.
import Foundation

struct FillFakeData {
    
    var userGroup: [Group] = []
    
    func fillUserGroup(arr: inout [Group]) {
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
        var friend: Friend
        
        var photos = [LikePhoto(Photo("dog1"), Like(5)),
                      LikePhoto(Photo("dog2"), Like(0)),
                      LikePhoto(Photo("dog3"), Like(3)),
                      LikePhoto(Photo("dog4"), Like(1)),
                      LikePhoto(Photo("dog5"), Like(5)),
                      LikePhoto(Photo("dog6"), Like(1)),
                      LikePhoto(Photo("dog7"), Like(8)),
                      LikePhoto(Photo("dog8"), Like(7))]
        
        friend = Friend(name: "Собакевич Дог Шарикович", avatar: "dog_avatar", status: .onLine, photos: photos)
        arr.append(friend)
        
        
        photos = [LikePhoto(Photo("cat1"), Like(0)),
                  LikePhoto(Photo("cat2"), Like(0)),
                  LikePhoto(Photo("cat3"), Like(0)),
                  LikePhoto(Photo("cat4"), Like(0)),
                  LikePhoto(Photo("cat5"), Like(0)),
                  LikePhoto(Photo("cat6"), Like(0)),
                  LikePhoto(Photo("cat7"), Like(0)),
                  LikePhoto(Photo("cat8"), Like(0)),
                  LikePhoto(Photo("cat9"), Like(0)),
                  LikePhoto(Photo("cat10"), Like(0)),
                  LikePhoto(Photo("cat11"), Like(0)),
                  LikePhoto(Photo("cat12"), Like(0))]
        friend = Friend(name: "Котейка Мурлыкович", avatar: "cat_avatar", status: .offLine, photos: photos)
        arr.append(friend)
        
        photos = [LikePhoto(Photo("dima1"), Like(0)),
                  LikePhoto(Photo("dima2"), Like(0)),
                  LikePhoto(Photo("dima3"), Like(0))]
        friend = Friend(name: "Сосед Диман", avatar: "dima_avatar", status: .offLine, photos: photos)
        arr.append(friend)
        
        for _ in 0...5 {
            
            photos = [LikePhoto(Photo("sveta"), Like(0))]
            friend = Friend(name: "Айкина Света", avatar: "sveta_avatar", status: .onLine, photos: photos)
            arr.append(friend)
            
            friend = Friend(name: "Бараш", avatar: "barash_avatar", status: .onLine, photos: [])
            arr.append(friend)
            
            friend = Friend(name: "Нюша", avatar: "nysha_avatar", status: .onLine, photos: [])
            arr.append(friend)
            
            friend = Friend(name: "Карыч", avatar: "nysha_avatar", status: .onLine, photos: [])
            arr.append(friend)
            
            friend = Friend(name: "Пин", avatar: "nysha_avatar", status: .onLine, photos: [])
            arr.append(friend)
            
            friend = Friend(name: "Лосяш", avatar: "nysha_avatar", status: .onLine, photos: [])
            arr.append(friend)
            
            friend = Friend(name: "Совунья", avatar: "nysha_avatar", status: .onLine, photos: [])
            arr.append(friend)
            
            friend = Friend(name: "Копатыч", avatar: "nysha_avatar", status: .onLine, photos: [])
            arr.append(friend)
        }
        
        
        for i in 0...1 {
            arr.append(Friend(name: "Дружбан \(i)", avatar: nil, status: .onLine, photos: []))
        }
        
        
        arr = arr.sorted(by: {$0.name < $1.name})
    }
    
    func arrFirstChar(arrFriends: [Friend]) -> [String] {
        return Array(Set(arrFriends.compactMap { String($0.name.first ?? "*") })).sorted()
    }
}
