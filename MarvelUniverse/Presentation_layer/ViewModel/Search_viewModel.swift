//
//  Search_viewModel.swift
//  MarvelUniverse
//
//  Created by Hader on 19/6/23.
//

import Foundation
class SearchViewModel {
    
    var bindResultToSearchView : (() -> ()) = {}
    var bindSearchResultToSearchView : (() -> ()) = {}

   
    var allSeries : [SeriesData] = []{
        didSet{
            //bind the result
            bindResultToSearchView()
        }
    }
    var searchedSeries: [SeriesData] = []{
        didSet{
        //    bind the search result
            bindSearchResultToSearchView()
       }
    }
    
    func getSeries(){
        
        NetworkManger.fetchData(apiLink: apiLinks.allSeriesApi.rawValue) { [self] (data: SeriesRequest?) in
            self.allSeries = data?.data?.results ?? []
            self.searchedSeries = data?.data?.results ?? []
            print(self.allSeries.count)
            print(self.searchedSeries.count)
        }
    }
}
