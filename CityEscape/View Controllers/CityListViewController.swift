//
//  CityListViewController.swift
//  CityEscape
//
//  Created by Austin Robertson on 12/5/25.
//

import UIKit

class CityListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let cellReuseIdentifier = "CityCollectionViewCell"
    let cities: [City] = [City(cityName: "Albuquerque, New Mexico", cityImgFile: "albuquerque", cityAbbreviation: "ABQ"),
                          City(cityName: "Amalfi Coast, Italy", cityImgFile: "amalfi_coast", cityAbbreviation: "Amalfi"),
                          City(cityName: "Amsterdam, Netherlands", cityImgFile: "amsterdam", cityAbbreviation: "AMS"),
                          City(cityName: "Bar Harbor, Maine", cityImgFile: "bar_harbor", cityAbbreviation: "BH"),
                          City(cityName: "Barcelona, Spain", cityImgFile: "barcelona", cityAbbreviation: "Barca"),
                          City(cityName: "Berlin, Germany", cityImgFile: "berlin", cityAbbreviation: "BER"),
                          City(cityName: "Copenhagen, Denmark", cityImgFile: "copenhagen", cityAbbreviation: "CPH"),
                          City(cityName: "Des Moines, Iowa", cityImgFile: "des_moines", cityAbbreviation: "DES"),
                          City(cityName: "Dresden, Germany", cityImgFile: "dresden", cityAbbreviation: "DRES"),
                          City(cityName: "Florence, Italy", cityImgFile: "florence", cityAbbreviation: "FIR"),
                          City(cityName: "Frankfurt, Germany", cityImgFile: "frankfurt", cityAbbreviation: "FRA"),
                          City(cityName: "Hamburg, Germany", cityImgFile: "hamburg", cityAbbreviation: "HAM"),
                          City(cityName: "Knoxville, Tennessee", cityImgFile: "knoxville", cityAbbreviation: "KNX"),
                          City(cityName: "Leipzig, Germany", cityImgFile: "leipzig", cityAbbreviation: "LPZ"),
                          City(cityName: "Lisbon, Portugal", cityImgFile: "lisbon", cityAbbreviation: "LIS"),
                          City(cityName: "London, England", cityImgFile: "london", cityAbbreviation: "LON"),
                          City(cityName: "Los Angeles, California", cityImgFile: "los_angeles", cityAbbreviation: "LA"),
                          City(cityName: "Lucerne, Switzerland", cityImgFile: "lucerne", cityAbbreviation: "LUC"),
                          City(cityName: "Manhattan Beach, California", cityImgFile: "manhattan_beach", cityAbbreviation: "MNHB"),
                          City(cityName: "Miami, Florida", cityImgFile: "miami", cityAbbreviation: "MIA"),
                          City(cityName: "Milan, Italy", cityImgFile: "milan", cityAbbreviation: "MIL"),
                          City(cityName: "München, Germany", cityImgFile: "munich", cityAbbreviation: "MUN"),
                          City(cityName: "New York City", cityImgFile: "nyc", cityAbbreviation: "NYC"),
                          City(cityName: "Oslo, Norway", cityImgFile: "oslo", cityAbbreviation: "OSL"),
                          City(cityName: "Palm Springs, California", cityImgFile: "palm_springs", cityAbbreviation: "PS"),
                          City(cityName: "Paris, France", cityImgFile: "paris", cityAbbreviation: "PAR"),
                          City(cityName: "Philadelphia, PA", cityImgFile: "philadelphia", cityAbbreviation: "PHIL"),
                          City(cityName: "Pisa, Italy", cityImgFile: "pisa", cityAbbreviation: "Pisa"),
                          City(cityName: "Pompeii, Italy", cityImgFile: "pompeii", cityAbbreviation: "POM"),
                          City(cityName: "Prague, Czech Republic", cityImgFile: "prague", cityAbbreviation: "PRG"),
                          City(cityName: "Rome, Italy", cityImgFile: "rome", cityAbbreviation: "Rome"),
                          City(cityName: "Salzburg, Austria", cityImgFile: "salzburg", cityAbbreviation: "SZBG"),
                          City(cityName: "San Gimignano, Italy", cityImgFile: "san_gimignano", cityAbbreviation: "SGM"),
                          City(cityName: "Sedona, Arizona", cityImgFile: "sedona", cityAbbreviation: "SED"),
                          City(cityName: "San Francisco, California", cityImgFile: "sf", cityAbbreviation: "SF"),
                          City(cityName: "Washington D.C.", cityImgFile: "washington_dc", cityAbbreviation: "DC"),
                          City(cityName: "Zürich, Switzerland", cityImgFile: "zurich", cityAbbreviation: "Zür")]

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
        cell.cityImageView.image = cities[indexPath.row].cityImg
        
        cell.cityImageView.layer.cornerRadius = 15.0
        cell.cityImageView.layer.masksToBounds = true
        cell.cityImageView.layer.borderWidth = 0.5
        cell.cityImageView.layer.borderColor = UIColor.black.cgColor
    
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
