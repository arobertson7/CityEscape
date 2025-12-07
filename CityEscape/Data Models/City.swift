//
//  City.swift
//  CityEscape
//
//  Created by Austin Robertson on 12/5/25.
//

import Foundation
import UIKit

class City {
    let cityName: String
    let cityImg: UIImage?
    let cityAbbreviation: String
    
    init(cityName: String, cityImgFile: String, cityAbbreviation: String) {
        self.cityName = cityName
        self.cityImg = UIImage(named: cityImgFile)
        self.cityAbbreviation = cityAbbreviation
    }
}
