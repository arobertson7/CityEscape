//
//  TripDetailsViewController.swift
//  CityEscape
//
//  Created by Austin Robertson on 12/7/25.
//

import UIKit

class TripDetailsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    let cellReuseIdentifier = "TripDestinationCell"
    var destinations: [City] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - CollectionView DataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (destinations.count * 2) - 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! TripDestinationCell
        
        if (indexPath.row % 2 == 0) {
            let destination = destinations[indexPath.row / 2]
            
            cell.cityNameLabel.text = destination.cityName
            cell.cityImageView.image = UIImage(named: destination.cityImgFile)
            
            cell.cityImageView.layer.cornerRadius = 30.0
            cell.cityImageView.layer.masksToBounds = true
            cell.cityImageView.contentMode = .scaleAspectFill
        } else if (indexPath.row % 2 == 1) {
            cell.cityImageView.image = UIImage(named: "arrow")
            cell.cityNameLabel.text = "2 hours ✈️"
            cell.cityImageView.contentMode = .scaleAspectFit
        }
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
