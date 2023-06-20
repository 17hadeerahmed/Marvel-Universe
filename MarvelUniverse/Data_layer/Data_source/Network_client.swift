//
//  Network_client.swift
//  MarvelUniverse
//
//  Created by Hader on 18/6/23.
//

import Foundation

let apiUrl : apiLinks = .allSeriesApi
protocol NetworkClientProtocol {
    
   static func getAllSeries (complitionHandler : @escaping (SeriesRequest?) -> Void)
   static func searchedSeries (complitionHandler : @escaping (SeriesRequest?) -> Void)
}

class NetworkClient : NetworkClientProtocol {
    static func searchedSeries(complitionHandler: @escaping (SeriesRequest?) -> Void) {
        NetworkManger.fetchData(apiLink: apiUrl.rawValue) {(data: SeriesRequest?) in
            complitionHandler(nil)
        }
    }
    
    static func getAllSeries(complitionHandler: @escaping (SeriesRequest?) -> Void) {
        NetworkManger.fetchData(apiLink: apiUrl.rawValue) {(data: SeriesRequest?) in
            complitionHandler(nil)
    }
        
    }
    
    
    
}
