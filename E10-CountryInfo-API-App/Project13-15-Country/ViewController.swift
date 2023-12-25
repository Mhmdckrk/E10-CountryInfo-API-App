//
//  ViewController.swift
//  Project13-15-Country
//
//  Created by Mahmud CIKRIK on 23.10.2023.
//

import UIKit

class ViewController: UITableViewController {

//    var populations = [Population]()
//    var countries = [Country]()
//    var names = [Name]() kullanılmadı
     var countries = [Country]()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let urlString = "https://restcountries.com/v3.1/all?fields=name,flags,currencies,languages,region,capital,area,population,maps,timezones"
        if let url = URL(string: urlString){
            if let data = try? Data(contentsOf: url) {
                // we're OK to Parse Data
                parse(json: data)
                return
            }
        }
        

    }
    
    func parse(json: Data) {
        
        let decoder = JSONDecoder()
        if let jsonNames = try? decoder.decode([Country].self, from: json) {
            countries = jsonNames
//                for Population in populations {
//                    print("hello: \(Population.population)")
//                }
                tableView.reloadData()
            }
            
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(populations.count)
        // neden 4 kez basıyor?? bu sistemi yormaz mı? tableView.reloadData() yapınca da 2 kez basıyor??
        print(countries.count)
        return countries.count

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let country = countries[indexPath.row]
        cell.textLabel?.text = "\(country.name.common)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        
        vc.detailItem = countries[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        
    }


}

