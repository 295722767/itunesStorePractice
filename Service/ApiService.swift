//
//  ApiService.swift
//  AppStoreJSONApis
//
//  Created by Mao Li on 4/8/19.
//  Copyright © 2019 MaoLi. All rights reserved.
//

import Foundation

class Service {
    
    static let shared = Service()  // singleton
    
    // fetchItunesApps from search page
    func fetchApps(completion: @escaping ([Result], Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
        guard let url = URL(string: urlString)  else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                print("Failed to fetch apps:", err)
                completion([], err)
                return
            }
            //success
            guard let data = data else { return }
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult.results, nil)
            } catch let jsonErr {
                print("Failed to decode json:", jsonErr)
                completion([], jsonErr)
            }
            }.resume()     // fires off the request   MOST IMPORTANT
    }
}
