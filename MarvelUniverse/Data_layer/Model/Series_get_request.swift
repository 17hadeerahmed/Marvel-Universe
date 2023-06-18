//
//  Series_get_request.swift
//  MarvelUniverse
//
//  Created by Hader on 17/6/23.
//

import Foundation


struct SeriesRequest : Codable {
    var code : String?
    var status : String?
    var copyright : String?
    var attributionText : String?
    var attributionHTML : String?
    var etag : String?
    var data : [AllSeries]?
    
}

struct AllSeries : Codable{
    var total : Int?
    var count : Int?
    var results : [SeriesData]?
}


struct SeriesData : Codable{
    var id : Int?
    var title : String?
    var description : String?
    var startYear : String?
    var thumbnail : [SeriesImg]?
    var creators : [CreatorsData]?
    
}

struct SeriesImg : Codable {
    var path : String?
    var `extension` : String?
    
}

struct CreatorsData : Codable {
    var items : [CreatorInfo]?
}

struct CreatorInfo : Codable{
    var name : String?
    var role : String?
}

