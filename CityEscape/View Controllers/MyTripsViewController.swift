//
//  MyTripsViewController.swift
//  CityEscape
//
//  Created by Austin Robertson on 12/8/25.
//

import UIKit

class MyTripsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    let cellReuseIdentifier = "MyTripCell"
    
    var testData: [Trip] = [
        Trip("Trip 1",
             [City(cityName: "Amalfi Coast, Italy", cityImgFile: "amalfi_coast", cityAbbreviation: "Amalfi"),
              City(cityName: "Amsterdam, Netherlands", cityImgFile: "amsterdam", cityAbbreviation: "AMS"),
              City(cityName: "Bar Harbor, Maine", cityImgFile: "bar_harbor", cityAbbreviation: "BH"),
              City(cityName: "Barcelona, Spain", cityImgFile: "barcelona", cityAbbreviation: "Barca")
             ]),
        Trip("Trip 2",
             [City(cityName: "München, Germany", cityImgFile: "munich",cityAbbreviation: "MUN"),
              City(cityName: "New York City", cityImgFile: "nyc", cityAbbreviation: "NYC"),
              City(cityName: "Oslo, Norway", cityImgFile: "oslo", cityAbbreviation: "OSL"),
              City(cityName: "Palm Springs, California", cityImgFile: "palm_springs", cityAbbreviation: "PS")
             ])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - CollectionView DataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! MyTripCell
    
        let imagesContainer = cell.imagesContainer!
        imagesContainer.layer.cornerRadius = 20.0
        imagesContainer.layer.masksToBounds = true
        imagesContainer.layer.borderWidth = 1.5
        imagesContainer.layer.borderColor = UIColor.darkGray.cgColor
        
        let tripDestinations = testData[indexPath.row].destinations
        let cellImageViews = cell.destinationImageViews!
        for i in 0..<cellImageViews.count {
            if (i < tripDestinations.count) {
                cellImageViews[i].image = UIImage(named: tripDestinations[i].cityImgFile)
            }
        }
        cell.tripNameLabel.text = testData[indexPath.row].tripName
        
    
        return cell
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
