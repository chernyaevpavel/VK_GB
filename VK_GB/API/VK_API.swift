//
//  VK_API.swift
//  VK_GB
//
//  Created by Павел Черняев on 21.06.2021.
//

import Foundation
import Alamofire

class VK_API {
    private let scheme = "https"
    private let host = "api.vk.com"
    private let versionAPI = "5.68"
    
    private func getSessionToken() -> String? {
        let sessionToken = Session.shared.token
        if sessionToken.isEmpty {
            print("Не удалось получить ключ доступа к приложению")
            return nil
        }
        return sessionToken
    }
    
    func getFriends() {
        let path = "/method/friends.get"
        let queryItems = [
            URLQueryItem(name: "order", value: "name"),
            URLQueryItem(name: "fields", value: "nickname, domain, sex, bdate, city, country, timezone, photo_50, photo_100, photo_200_orig, has_mobile, contacts, education, online, relation, last_seen, status, can_write_private_message, can_see_all_posts, can_post, universities")
        ]
        makeRequest(path, queryItems)
    }
    
    func getPhotos(ownerID: String){
        let path = "/method/photos.getAll"
        let queryItems = [
            URLQueryItem(name: "owner_id", value: ownerID),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "offset", value: ""),
            URLQueryItem(name: "count", value: "200"),
            URLQueryItem(name: "photo_sizes", value: "0"),
            URLQueryItem(name: "no_service_albums", value: "0"),
            URLQueryItem(name: "need_hidden", value: "0"),
            URLQueryItem(name: "skip_hidden", value: "1")
        ]
        makeRequest(path, queryItems)
    }
    
    func getGroups() {
        let path = "/method/groups.get"
        let  queryItems = [
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "fields", value: "city, country, place, description, wiki_page, members_count, counters, start_date, finish_date, can_post, can_see_all_posts, activity, status, contacts, links, fixed_post, verified, site, can_create_topic")
        ]
        makeRequest(path, queryItems)
    }
    
    func groupsSearch(textSearchRequest q: String) {
        let path = "/method/groups.search"
        let queryItems = [
            URLQueryItem(name: "q", value: q),
            URLQueryItem(name: "type", value: "group")
        ]        
        makeRequest(path, queryItems)
    }
    
    private func makeRequest(_ path: String, _ queryItems: [URLQueryItem]) {
        guard let sessionToken = getSessionToken() else { return }
        var urlConstructor = URLComponents()
        urlConstructor.scheme = scheme
        urlConstructor.host = host
        urlConstructor.path = path
        urlConstructor.queryItems =  [URLQueryItem(name: "access_token", value: sessionToken)] + queryItems + [URLQueryItem(name: "v", value: versionAPI)]
        let configuration = URLSessionConfiguration.default
        let session =  URLSession(configuration: configuration)
        let task = session.dataTask(with: urlConstructor.url!) { (data, response, error) in
            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableLeaves)
            print(json ?? "")
        }
        task.resume()
        
    }
}
