//
//  City.swift
//  CityEscape
//
//  Created by Austin Robertson on 12/5/25.
//

import Foundation
import UIKit

class City: Codable {
    let cityName: String
    let cityImgFile: String
    let cityAbbreviation: String
    
    init(cityName: String, cityImgFile: String, cityAbbreviation: String) {
        self.cityName = cityName
        self.cityImgFile = cityImgFile
        self.cityAbbreviation = cityAbbreviation
    }
}
