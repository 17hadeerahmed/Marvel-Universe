//
//  Base_Repositary.swift
//  MarvelUniverse
//
//  Created by Hader on 18/6/23.
//

import Foundation

protocol BaseRepositary {
    static func getAllSeries (complitionHandler : @escaping (SeriesRequest?) -> Void)
    static func searchedSeries (complitionHandler : @escaping (SeriesRequest?) -> Void)
}
