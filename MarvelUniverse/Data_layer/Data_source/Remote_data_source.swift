//
//  Remote_data_source.swift
//  MarvelUniverse
//
//  Created by Hader on 18/6/23.
//

import Foundation

protocol RemoteDataSourceProtocol {
    
   static func getAllSeries (complitionHandler : @escaping (SeriesRequest?) -> Void)
}

class RemoteDataSource : RemoteDataSourceProtocol {
    static func getAllSeries(complitionHandler: @escaping (SeriesRequest?) -> Void) {
        NetworkClient.getAllSeries { (data: SeriesRequest?) in
            complitionHandler(data)
        }
    }
    
    
    
}
