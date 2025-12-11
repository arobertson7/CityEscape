//
//  ExploreCitiesViewController.swift
//  CityEscape
//
//  Created by Austin Robertson on 12/5/25.
//

import UIKit

class ExploreCitiesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let cellReuseIdentifier = "CityCollectionViewCell"
    var dataModel: DataModel!
    var cities = [City]() // default cities are passed in by the data model on app load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cities = dataModel.defaultCities
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
            
            cityDetailsScreen.dataModel = dataModel
        }
    }


}
