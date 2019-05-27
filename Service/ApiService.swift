//
//  ApiService.swift
//  AppStoreJSONApis
//
//  Created by Mao Li on 4/8/19.
//  Copyright © 2019 MaoLi. All rights reserved.
//

import Foundation

class Service {
    
    // singleton
    static let shared = Service()
    
    // fetchItunesApps from search page
    func fetchApps(searchTerm: String, completion: @escaping (SearchResult?, Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        fetchGenericJSONData(urlString: urlString, completion: completion)
        
//        guard let url = URL(string: urlString)  else { return }
//        URLSession.shared.dataTask(with: url) { (data, resp, err) in
//            if let err = err {
//                print("Failed to fetch apps:", err)
//                completion([], err)
//                return
//            }
//            //success
//            guard let data = data else { return }
//            do {
//                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
//                completion(searchResult.results, nil)
//            } catch let jsonErr {
//                print("Failed to decode json:", jsonErr)
//                completion([], jsonErr)
//            }
//        }.resume()     // fires off the request   MOST IMPORTANT
        
    }
    
    // nil means no error or no AppGroup object
    func fetchTopFree(completion: @escaping (AppGroup?, Error?) -> ()) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/10/explicit.json"
        //fetchAppGroups(urlString: urlString, completion: completion)
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchTopGames(completion: @escaping (AppGroup?, Error?) -> ()) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/10/explicit.json"
        //fetchAppGroups(urlString: urlString, completion: completion)
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchTopGrossing(completion: @escaping (AppGroup?, Error?) -> ()) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/10/explicit.json"
        //fetchAppGroups(urlString: urlString, completion: completion)
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    
    func fetchAppGroups(urlString: String, completion: @escaping (AppGroup?, Error?) -> Void) {
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
//    func fetchExample(completion: @escaping (AppGroup?, Error?) -> ()) {
//        let urlString = ""
//        guard let url = URL(string: urlString)  else { return }
//        URLSession.shared.dataTask(with: url) { (data, resp, err) in
//            if let err = err {
//                completion(nil, err)
//                return
//            }
//            guard let data = data else { return }
//            do {
//                let appResult = try JSONDecoder().decode(AppGroup.self, from: data)
//                completion(appResult, nil)
//            } catch let jsonErr {
//                completion(nil, jsonErr)
//            }
//        }.resume()
//    }
    
    func fetchPromotion(completion: @escaping ([promotionObject]?, Error?) -> Void) {
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }

    // declare my generic json function here
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> Void) {
        guard let url = URL(string: urlString)  else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                return
            }
            guard let data = data else { return }
            do {
                let object = try JSONDecoder().decode(T.self, from: data)
                completion(object, nil)
            } catch let jsonErr {
                completion(nil, jsonErr)
            }
        }.resume()
    }
    
}


