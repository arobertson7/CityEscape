//
//  CreateTripViewController.swift
//  CityEscape
//
//  Created by Austin Robertson on 12/6/25.
//

import UIKit

class CreateTripViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    let cellReuseIdentifier = "CityCollectionViewCell"
    var dataModel: DataModel!
    var cities = [City]()
    
    var selectedDestinations: [City] = []
    @IBOutlet var destinationsContainerView: UIView!
    @IBOutlet var destinationImageViews: [UIImageView]!
    @IBOutlet var destinationAbbreviationLabels: [UILabel]!
    @IBOutlet var goButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        cities = dataModel.defaultCities
        
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
        
        // goButton visibility
        goButton.isHidden = selectedDestinations.count < 2
        goButton.tintColor = UIColor(red: 45 / 255.0, green: 182 / 255.0, blue: 93 / 255.0, alpha: 1.0)
    }
    
    // MARK: - CollectionView DataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! CityCollectionViewCell
        let city = cities[indexPath.row]
        
        cell.cityNameLabel.text = city.cityName
        cell.cityImageView.image = UIImage(named: city.cityImgFile)
        
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
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ShowCreatedTrip") {
            let tripViewController = segue.destination as! TripDetailsViewController
            tripViewController.destinations = selectedDestinations
        }
    }
    
     
    // MARK: - Helper functions
    func updateDestinationsContainerDisplay() {
        // clear display
        for i in 0..<5 {
            destinationImageViews[i].image = nil
            destinationAbbreviationLabels[i].text = String(i + 1)
        }
        // update display
        for i in 0..<selectedDestinations.count {
            destinationImageViews[i].image = UIImage(named: selectedDestinations[i].cityImgFile)
            destinationAbbreviationLabels[i].text = selectedDestinations[i].cityAbbreviation
        }
        // goButton visibility
        goButton.isHidden = selectedDestinations.count < 2
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
