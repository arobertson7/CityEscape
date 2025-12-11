//
//  MyCitiesViewController.swift
//  CityEscape
//
//  Created by Austin Robertson on 12/8/25.
//

import UIKit

class MyCitiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let cellReuseIdentifier = "MyCityCell"
    @IBOutlet var tableView: UITableView!
    var dataModel: DataModel!
    var myCities = [City]()
    
//    let testData: [City] = [City(cityName: "Albuquerque, New Mexico", cityImgFile: "albuquerque", cityAbbreviation: "ABQ"),
//                          City(cityName: "Amalfi Coast, Italy", cityImgFile: "amalfi_coast", cityAbbreviation: "Amalfi"),
//                          City(cityName: "Amsterdam, Netherlands", cityImgFile: "amsterdam", cityAbbreviation: "AMS"),
//                          City(cityName: "Bar Harbor, Maine", cityImgFile: "bar_harbor", cityAbbreviation: "BH"),
//                          City(cityName: "Barcelona, Spain", cityImgFile: "barcelona", cityAbbreviation: "Barca")]

    override func viewDidLoad() {
        super.viewDidLoad()

        myCities = dataModel.myCities
    }
    
    // MARK: - Table View Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! MyCityCell
        
        cell.cityImageView.image = UIImage(named: myCities[indexPath.row].cityImgFile)
        cell.cityNameLabel.text = myCities[indexPath.row].cityName
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.systemGray.cgColor
        
        return cell
    }
    

    // MARK: - observer functions
    func updateMyCities(_ myCities: [City]) {
        self.myCities = myCities
        tableView.reloadData()
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
