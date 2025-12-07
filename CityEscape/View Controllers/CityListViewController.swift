//
//  CityListViewController.swift
//  CityEscape
//
//  Created by Austin Robertson on 12/5/25.
//

import UIKit

class CityListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let cellReuseIdentifier = "CityCollectionViewCell"
    let cities: [City] = [City(cityName: "Albuquerque, New Mexico", cityImgFile: "albuquerque"),
                          City(cityName: "Amalfi Coast, Italy", cityImgFile: "amalfi_coast"),
                          City(cityName: "Amsterdam, Netherlands", cityImgFile: "amsterdam"),
                          City(cityName: "Bar Harbor, Maine", cityImgFile: "bar_harbor"),
                          City(cityName: "Barcelona, Spain", cityImgFile: "barcelona"),
                          City(cityName: "Berlin, Germany", cityImgFile: "berlin"),
                          City(cityName: "Copenhagen, Denmark", cityImgFile: "copenhagen"),
                          City(cityName: "Des Moines, Iowa", cityImgFile: "des_moines"),
                          City(cityName: "Dresden, Germany", cityImgFile: "dresden"),
                          City(cityName: "Florence, Italy", cityImgFile: "florence"),
                          City(cityName: "Frankfurt, Germany", cityImgFile: "frankfurt"),
                          City(cityName: "Hamburg, Germany", cityImgFile: "hamburg"),
                          City(cityName: "Knoxville, Tennessee", cityImgFile: "knoxville"),
                          City(cityName: "Leipzig, Germany", cityImgFile: "leipzig"),
                          City(cityName: "Lisbon, Portugal", cityImgFile: "lisbon"),
                          City(cityName: "London, England", cityImgFile: "london"),
                          City(cityName: "Los Angeles, California", cityImgFile: "los_angeles"),
                          City(cityName: "Lucerne, Switzerland", cityImgFile: "lucerne"),
                          City(cityName: "Manhattan Beach, California", cityImgFile: "manhattan_beach"),
                          City(cityName: "Miami, Florida", cityImgFile: "miami"),
                          City(cityName: "Milan, Italy", cityImgFile: "milan"),
                          City(cityName: "München, Germany", cityImgFile: "munich"),
                          City(cityName: "New York City", cityImgFile: "nyc"),
                          City(cityName: "Oslo, Norway", cityImgFile: "oslo"),
                          City(cityName: "Palm Springs, California", cityImgFile: "palm_springs"),
                          City(cityName: "Paris, France", cityImgFile: "paris"),
                          City(cityName: "Philadelphia, PA", cityImgFile: "philadelphia"),
                          City(cityName: "Pisa, Italy", cityImgFile: "pisa"),
                          City(cityName: "Pompeii, Italy", cityImgFile: "pompeii"),
                          City(cityName: "Prague, Czech Republic", cityImgFile: "prague"),
                          City(cityName: "Rome, Italy", cityImgFile: "rome"),
                          City(cityName: "Salzburg, Austria", cityImgFile: "salzburg"),
                          City(cityName: "San Gimignano, Italy", cityImgFile: "san_gimignano"),
                          City(cityName: "Sedona, Arizona", cityImgFile: "sedona"),
                          City(cityName: "San Francisco, California", cityImgFile: "sf"),
                          City(cityName: "Washington D.C.", cityImgFile: "washington_dc"),
                          City(cityName: "Zürich, Switzerland", cityImgFile: "zurich")]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - CollectionView DataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! CityCollectionViewCell
    
        cell.cityNameLabel.text = cities[indexPath.row].cityName
        cell.cityImage.image = cities[indexPath.row].cityImg
        
        cell.cityImage.layer.cornerRadius = 15.0
        cell.cityImage.layer.masksToBounds = true
        cell.cityImage.layer.borderWidth = 0.5
        cell.cityImage.layer.borderColor = UIColor.black.cgColor
    
        return cell
    }
    
    // MARK: - CollectionView Delegate
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        let cityToDisplay = cities[indexPath.row]
        performSegue(withIdentifier: "ShowCityDetails", sender: cityToDisplay)
    }
    


    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowCityDetails" {

            let cityDetailsScreen = segue.destination as! CityDetailsViewController
            cityDetailsScreen.city = sender as? City
        }
    }


}
