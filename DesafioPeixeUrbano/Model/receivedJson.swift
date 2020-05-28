//
//  receivedJson.swift
//  DesafioPeixeUrbano
//
//  Created by Denis Janoto on 13/05/20.
//  Copyright © 2020 Denis Janoto. All rights reserved.
//


import Foundation

// MARK: - ReceivedJSON
struct receivedJson: Codable {
    let code: Int
    let response: Response
}
// MARK: - Response
struct Response: Codable {
    let banners: [Banner]
    let deals: [Deal]
}
// MARK: - Banner
struct Banner: Codable {
    let name, title:String
    let mobile: Mobile
    
    enum CodingKeys: String, CodingKey {
        case name, title
        case mobile
    }
}
// MARK: - Mobile
struct Mobile: Codable {
    let pages: [String]
    let mobileImage: String
    let type: Int
    let link, tagMarketing, collections, category: String
    let subcategories, regions, attributes: String
    let active, isActivation: Bool
    
    enum CodingKeys: String, CodingKey {
        case pages
        case mobileImage = "mobile_image"
        case type, link
        case tagMarketing = "tag_marketing"
        case collections, category, subcategories, regions, attributes, active
        case isActivation = "is_activation"
    }
}
// MARK: - Deal
struct Deal: Codable {
    
    let title, shortTitle:String
    //let location:[Location]
    let dealImage:String
    let salePrice:Double
    let ultraBriefDescription:String
    let locations:[Partner]
    
    enum CodingKeys: String, CodingKey {
        
        case title
        case shortTitle = "short_title"
        //    case location
        case dealImage
        case salePrice = "sale_price"
        case ultraBriefDescription = "ultra_brief_description"
        case locations
    }
}


struct Partner: Codable {
    
    
    let lat, lng: Double?
    
    
    enum CodingKeys: String, CodingKey {
        
        case lat, lng
        
    }
}
