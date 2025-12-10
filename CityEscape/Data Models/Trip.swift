//
//  Trip.swift
//  CityEscape
//
//  Created by Austin Robertson on 12/9/25.
//

import Foundation

class Trip {
    var tripName: String
    let destinations: [City] // in order
    
    init(_ tripName: String, _ destinations: [City]) {
        self.tripName = tripName
        self.destinations = destinations
    }
}


// destinations
