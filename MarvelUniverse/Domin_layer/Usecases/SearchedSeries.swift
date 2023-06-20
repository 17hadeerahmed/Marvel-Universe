//
//  SearchedSeries.swift
//  MarvelUniverse
//
//  Created by Hader on 19/6/23.
//


import Foundation

protocol SearchedSeriesUseCaseProtocol {
    static func searchedSeries (complitionHandler : @escaping (SeriesRequest?) -> Void)
}

class  searchedUseCase : SearchedSeriesUseCaseProtocol {
    
    static func searchedSeries(complitionHandler: @escaping (SeriesRequest?) -> Void) {
        Repositary.searchedSeries { (data: SeriesRequest?) in
            complitionHandler(nil)
        }
    }
    
    
    
}
