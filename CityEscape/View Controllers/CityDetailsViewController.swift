//
//  CityDetailsViewController.swift
//  CityEscape
//
//  Created by Austin Robertson on 12/6/25.
//

import UIKit

protocol CityDetailsViewControllerDelegate: AnyObject {
    func CityDetailsViewController(
        _ controller: CityDetailsViewController,
        favorited city: City
    )
    
    func CityDetailsViewController(
        _ controller: CityDetailsViewController,
        unfavorited city: City
    )
}

class CityDetailsViewController: UIViewController {
    var city: City!
    var dataModel: DataModel!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var travelDetailsLabel: UILabel!
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var favoriteButton: UIButton!
    @IBOutlet var cityMessageLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let city = city {
            cityNameLabel.text = city.cityName
            cityImageView.image = UIImage(named: city.cityImgFile)
            
            cityImageView.layer.cornerRadius = 15.0
            cityImageView.layer.masksToBounds = true
            cityImageView.layer.borderWidth = 0.5
            cityImageView.layer.borderColor = UIColor.black.cgColor
        }
    }
    
    @IBAction func toggleFavoriteButton(_ favoriteButton: UIButton) {
        let newIcon = favoriteButton.titleLabel!.text == "♡" ? "🩷" : "♡"
        favoriteButton.setTitle(newIcon, for: .normal)
        
        if (newIcon == "🩷") {
            dataModel.CityDetailsViewController(self, favorited: city)
        } else {
            dataModel.CityDetailsViewController(self, unfavorited: city)
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
