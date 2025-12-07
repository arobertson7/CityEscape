//
//  CreateTripViewController.swift
//  CityEscape
//
//  Created by Austin Robertson on 12/6/25.
//

import UIKit

class CreateTripViewController: UIViewController {
    @IBOutlet var destinationsContainerView: UIView!
    @IBOutlet var destinationImageViews: [UIImageView]!
    @IBOutlet var destinationAbbreviationLabels: [UILabel]!
    
    let cities: [City] = [City(cityName: "ABQ", cityImgFile: "albuquerque"),
                          City(cityName: "Amalfi", cityImgFile: "amalfi_coast"),
                          City(cityName: "AMS", cityImgFile: "amsterdam"),
                          City(cityName: "Main", cityImgFile: "bar_harbor"),
                          City(cityName: "Barca", cityImgFile: "barcelona")]

    override func viewDidLoad() {
        super.viewDidLoad()

//        for i in 0..<cities.count {
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
