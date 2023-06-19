//
//  AllSeries_usecase.swift
//  MarvelUniverse
//
//  Created by Hader on 19/6/23.
//

import Foundation

protocol AllSeriesUseCaseProtocol {
    static func getAllSeries (complitionHandler : @escaping (SeriesRequest?) -> Void)
}

class  AllSeriesUseCase : AllSeriesUseCaseProtocol {
    static func getAllSeries(complitionHandler: @escaping (SeriesRequest?) -> Void) {
        Repositary.getAllSeries { (data: SeriesRequest?) in
            complitionHandler(nil)
        }
    }
    
    
    
}
