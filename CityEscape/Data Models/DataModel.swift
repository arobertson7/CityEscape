//
//  DataModel.swift
//  CityEscape
//
//  Created by Austin Robertson on 12/10/25.
//

import Foundation

class DataModel: CityDetailsViewControllerDelegate {
    var defaultCities = [City]()
    var myCities = [City]()
    var observersOfMyCities = [Any]()
    
    init() {
        loadDefaultCities()
        if (defaultCities.isEmpty) { // for first app open
            storeDefaultCities()
            loadDefaultCities()
        }
        loadMyCities()
        print("defaultCities file path: \(getDataFilePath(dataCollection: "defaultCities"))")
    }
    
    // MARK: - Storage and Retrieval
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask)
        return paths[0]
    }

    func getDataFilePath(dataCollection: String) -> URL {
        return documentsDirectory().appendingPathComponent("\(dataCollection).plist")
    }
    
    func loadDefaultCities() {
        let path = getDataFilePath(dataCollection: "defaultCities")

        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                defaultCities = try decoder.decode(
                    [City].self,
                    from: data)
            } catch {
                print("Error decoding deault cities: \(error.localizedDescription)")
            }
        }
    }
    
    func storeDefaultCities() {
        let defaultCities: [City] = [
            City(cityName: "Rome, Italy", cityImgFile: "rome", cityAbbreviation: "Rome"),
            City(cityName: "Amalfi Coast, Italy", cityImgFile: "amalfi_coast", cityAbbreviation: "Amalfi"),
            City(cityName: "Amsterdam, Netherlands", cityImgFile: "amsterdam", cityAbbreviation: "AMS"),
            City(cityName: "Bar Harbor, Maine", cityImgFile: "bar_harbor", cityAbbreviation: "BH"),
            City(cityName: "Lisbon, Portugal", cityImgFile: "lisbon", cityAbbreviation: "LIS"),
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
            City(cityName: "London, England", cityImgFile: "london", cityAbbreviation: "LON"),
            City(cityName: "Los Angeles, California", cityImgFile: "los_angeles", cityAbbreviation: "LA"),
            City(cityName: "Lucerne, Switzerland", cityImgFile: "lucerne", cityAbbreviation: "LUC"),
            City(cityName: "Manhattan Beach, California", cityImgFile: "manhattan_beach", cityAbbreviation: "MNHB"),
            City(cityName: "Albuquerque, New Mexico", cityImgFile: "albuquerque", cityAbbreviation: "ABQ"),
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
            City(cityName: "Salzburg, Austria", cityImgFile: "salzburg", cityAbbreviation: "SZBG"),
            City(cityName: "San Gimignano, Italy", cityImgFile: "san_gimignano", cityAbbreviation: "SGM"),
            City(cityName: "Sedona, Arizona", cityImgFile: "sedona", cityAbbreviation: "SED"),
            City(cityName: "San Francisco, California", cityImgFile: "sf", cityAbbreviation: "SF"),
            City(cityName: "Washington D.C.", cityImgFile: "washington_dc", cityAbbreviation: "DC"),
            City(cityName: "Zürich, Switzerland", cityImgFile: "zurich", cityAbbreviation: "Zür")]
        
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(defaultCities)
            try data.write(
                to: getDataFilePath(dataCollection: "defaultCities"),
                options: Data.WritingOptions.atomic)
        } catch {
            print("Error encoding default cities: \(error.localizedDescription)")
        }
    }
    
    func loadMyCities() {
        let path = getDataFilePath(dataCollection: "myCities")

        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                myCities = try decoder.decode(
                    [City].self,
                    from: data)
            } catch {
                print("Error decoding myCities: \(error.localizedDescription)")
            }
        }
    }
    
    func saveMyCities() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(myCities)
            try data.write(
                to: getDataFilePath(dataCollection: "myCities"),
                options: Data.WritingOptions.atomic)
        } catch {
            print("Error encoding myCities: \(error.localizedDescription)")
        }
    }
    
    // MARK: - CityDetailsViewController delegate
    
    func CityDetailsViewController(
        _ controller: CityDetailsViewController,
        favorited city: City
    ) {
        if (!isFavoritedCity(city)) {
            myCities.append(city)
            saveMyCities()
            
            for observer in observersOfMyCities {
                if let observer = observer as? MyCitiesViewController {
                    observer.updateMyCities(myCities)
                }
            }
        }
    }
    
    func CityDetailsViewController(
        _ controller: CityDetailsViewController,
        unfavorited city: City
    ) {
        if (isFavoritedCity(city)) {
            removeFromMyCities(city)
            saveMyCities()
            
            for observer in observersOfMyCities {
                if let observer = observer as? MyCitiesViewController {
                    observer.updateMyCities(myCities)
                }
            }
        }
    }
    
    // MARK: - Helper functions
    func isFavoritedCity(_ city: City) -> Bool {
        for myCity in myCities {
            if (myCity.cityName) == city.cityName {
                return true
            }
        }
        return false
    }
    
    func removeFromMyCities(_ city: City) { // removes city from myCities if exists, no effect if it doesn't
        var index = 0
        // get index to city
        while (index < myCities.count && myCities[index].cityName != city.cityName) {
            index += 1
        }
        // remove city
        while (index + 1 < myCities.count) {
            myCities[index] = myCities[index + 1]
            index += 1
        }
        if (!myCities.isEmpty) {
            myCities.removeLast()
        }
    }
    
//    func registerDefaults() {
//        let dictionary = [
//            "FirstTime": true
//        ] as [String: Any]
//        UserDefaults.standard.register(defaults: dictionary)
//    }
//    
//    func handleFirstTime() {
//        let userDefaults = UserDefaults.standard
//        let firstTime = userDefaults.bool(forKey: "FirstTime")
//        
//        if (firstTime) {
//            storeDefaultCities()
//            userDefaults.set(false, forKey: "FirstTime")
//        }
//    }
}
