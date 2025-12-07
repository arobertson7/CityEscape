//
//  CityDetailsViewController.swift
//  CityEscape
//
//  Created by Austin Robertson on 12/6/25.
//

import UIKit

class CityDetailsViewController: UIViewController {
    var city: City?
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var travelDetailsLabel: UILabel!
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var favoriteButton: UIButton!
    @IBOutlet var cityMessageLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let city = city {
            cityNameLabel.text = city.cityName
            cityImageView.image = city.cityImg
            
            cityImageView.layer.cornerRadius = 15.0
            cityImageView.layer.masksToBounds = true
            cityImageView.layer.borderWidth = 0.5
            cityImageView.layer.borderColor = UIColor.black.cgColor
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
