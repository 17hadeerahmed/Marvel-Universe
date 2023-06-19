//
//  Network_client.swift
//  MarvelUniverse
//
//  Created by Hader on 18/6/23.
//

import Foundation

protocol NetworkClientProtocol {
    
   static func getAllSeries (complitionHandler : @escaping (SeriesRequest?) -> Void)
}

class NetworkClient : NetworkClientProtocol {
    static func getAllSeries(complitionHandler: @escaping (SeriesRequest?) -> Void) {
        NetworkManger.fetchData(apiLink: apiLinks.allSeriesApi.rawValue) {(data: SeriesRequest?) in
            complitionHandler(data)
        }
    }
    
    
    
}
