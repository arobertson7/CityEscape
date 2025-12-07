//
//  TripDestinationCell.swift
//  CityEscape
//
//  Created by Austin Robertson on 12/7/25.
//

import UIKit

class TripDestinationCell: UICollectionViewCell {
    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    
    override func prepareForReuse() {
        cityImageView.image = nil
        cityNameLabel.text = nil
        self.backgroundColor = nil
        self.layer.cornerRadius = 0.0
    }
}
