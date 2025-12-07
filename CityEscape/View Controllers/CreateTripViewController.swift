//
//  CreateTripViewController.swift
//  CityEscape
//
//  Created by Austin Robertson on 12/6/25.
//

import UIKit

class CreateTripViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
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
    
    var selectedDestinations: [City] = []
    @IBOutlet var destinationsContainerView: UIView!
    @IBOutlet var destinationImageViews: [UIImageView]!
    @IBOutlet var destinationAbbreviationLabels: [UILabel]!

    override func viewDidLoad() {
        super.viewDidLoad()

//        for i in 0..<3 {
//            destinationImageViews[i].image = cities[i].cityImg
//            destinationAbbreviationLabels[i].text = cities[i].cityName
//        }
        
        //  destinationsContainerView styles
        destinationsContainerView.layer.cornerRadius = 10.0
        destinationsContainerView.layer.masksToBounds = true
        destinationsContainerView.layer.borderWidth = 2.0
        destinationsContainerView.layer.borderColor = UIColor.black.cgColor   
        
        //  destinationImageViews style
        for imageView in destinationImageViews {
            imageView.layer.cornerRadius = 10.0
            imageView.layer.masksToBounds = true
            imageView.layer.borderWidth = 0.8
            imageView.layer.borderColor = UIColor.black.cgColor
        }
        // destinationAbbreviationLabels styles
        for i in 0..<destinationAbbreviationLabels.count {
            destinationAbbreviationLabels[i].text = String(i + 1)
        }
    }
    
    // MARK: - CollectionView DataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! CityCollectionViewCell
        let city = cities[indexPath.row]
        
        cell.cityNameLabel.text = city.cityName
        cell.cityImageView.image = city.cityImg
        
        cell.cityImageView.layer.cornerRadius = 15.0
        cell.cityImageView.layer.masksToBounds = true
        
        if (isSelected(city.cityName)) {
            highlightSelectedCell(cell)
        } else {
            cell.cityImageView.layer.borderWidth = 0.5
            cell.cityImageView.layer.borderColor = UIColor.black.cgColor
        }
    
        return cell
    }
    
    // MARK: - CollectionView Delegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCity = cities[indexPath.row]
        let selectedCell = collectionView.cellForItem(at: indexPath) as! CityCollectionViewCell
        
        if (!isSelected(selectedCity.cityName)) {
            if (selectedDestinations.count < 5) {
                selectedDestinations.append(selectedCity)
                updateDestinationsContainerDisplay()
                highlightSelectedCell(selectedCell)
            }
        } else { // Deselect city
            removeFromSelectedDestinations(selectedCity.cityName)
            updateDestinationsContainerDisplay()
            selectedCell.cityImageView.layer.borderWidth = 0.5
            selectedCell.cityImageView.layer.borderColor = UIColor.black.cgColor
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
    
    // MARK: - Helper functions
    func updateDestinationsContainerDisplay() {
        // clear display
        for i in 0..<5 {
            destinationImageViews[i].image = nil
            destinationAbbreviationLabels[i].text = String(i + 1)
        }
        // update display
        for i in 0..<selectedDestinations.count {
            destinationImageViews[i].image = selectedDestinations[i].cityImg
            destinationAbbreviationLabels[i].text = selectedDestinations[i].cityAbbreviation
        }
    }
    
    func isSelected(_ cityName: String) -> Bool {
        for i in 0..<selectedDestinations.count {
            if selectedDestinations[i].cityName == cityName {
                return true
            }
        }
        return false
    }
    
    func highlightSelectedCell(_ cell: CityCollectionViewCell) {
        cell.cityImageView.layer.borderWidth = 7.0
        cell.cityImageView.layer.borderColor = UIColor.systemBlue.cgColor
    }
    
    func removeFromSelectedDestinations(_ cityName: String) {
        var index = 0;
        while (index < selectedDestinations.count && selectedDestinations[index].cityName != cityName) {
            index += 1
        }
        while (index + 1 < selectedDestinations.count) {
            selectedDestinations[index] = selectedDestinations[index + 1]
            index += 1
        }
        selectedDestinations.removeLast()
    }

}
