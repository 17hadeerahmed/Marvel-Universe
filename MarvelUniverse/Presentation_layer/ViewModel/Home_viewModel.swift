//
//  Home_viewModel.swift
//  MarvelUniverse
//
//  Created by Hader on 19/6/23.
//

import Foundation
class HomeViewModel {
    
    var bindResultToHomeView : (() -> ()) = {}
    var fetchSeriesRes : [SeriesData] = []{
        didSet{
            //bind the result
            bindResultToHomeView()
        }
    }
    
    
    func getSeries(){
        
        NetworkManger.fetchData(apiLink: apiLinks.allSeriesApi.rawValue) { (data: SeriesRequest?) in
            self.fetchSeriesRes = data?.data?.results ?? []
       
        }
    }
}



