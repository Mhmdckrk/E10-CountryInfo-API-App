//
//  Country.swift
//  Project13-15-Country
//
//  Created by Mahmud CIKRIK on 23.10.2023.
//

import Foundation

struct Country: Codable {
    
    var name: Name
    var flags: Flag
    var currencies : [String: Currency]
    var capital: [String]
    var languages: [String: String]
    var region: String
    var area: Double
    var maps: Map
    var timezones: [String]
    var population: Int

    
}

struct Name: Codable {
    
    var common: String
    var official: String
    
}

struct Flag: Codable {
    
    var png: String
    var svg: String
    var alt: String
    
}

struct Currency: Codable {
    
    var name: String
    var symbol: String
}


struct Map: Codable {
    
    var googleMaps: String
    var openStreetMaps: String


}
