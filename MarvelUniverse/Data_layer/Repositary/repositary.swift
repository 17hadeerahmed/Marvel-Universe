//
//  repositary.swift
//  MarvelUniverse
//
//  Created by Hader on 18/6/23.
//

import Foundation


class Repositary : BaseRepositary {
    static func searchedSeries(complitionHandler: @escaping (SeriesRequest?) -> Void) {
        RemoteDataSource.searchedSeries { (data: SeriesRequest?) in
            complitionHandler(nil)
        }
    }
    
    static func getAllSeries(complitionHandler: @escaping (SeriesRequest?) -> Void) {
        RemoteDataSource.getAllSeries { (data: SeriesRequest?) in
            complitionHandler(nil)
        }
    }
    
    
}
