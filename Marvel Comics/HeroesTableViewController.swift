//
//  HeroesTableViewController.swift
//  Marvel Comics
//
//  Created by user191958 on 5/19/21.
//  Copyright © 2021 Everton Dias. All rights reserved.
//

import UIKit

class HeroesTableViewController: UITableViewController {
    
    var name: String?
    var heroes:[Hero] = []
    var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    var loadingHeroes = false
    var curretPage = 0
    var total = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Buscando herois. Aguarde ..."
        loadHeroes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let vc = segue.destination as! HeroViewController
        vc.hero = heroes[tableView.indexPathForSelectedRow!.row]
        
    }
    
    func loadHeroes(){
        loadingHeroes = true
        ApiService.loadHeros(name: name, page: curretPage) { (info) in
        if let info = info {
            self.heroes += info.data.result
            self.total = info.data.total
            print("Total:", self.total,"- Ja incluidos:", self.heroes.count)
            DispatchQueue.main.async {
                self.loadingHeroes = false
                self.label.text = "Nao foram encontrados herois com o nome \(self.name!). "
                self.tableView.reloadData()
                
            }
            
        }
    }
}

    // MARK: - Table view data source
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundView = heroes.count == 0 ? label : nil
        return heroes.count
    }

    
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HeroTableViewCell
            
            let hero = heroes[indexPath.row]
            cell.prepareCell(with: hero)

        // Configure the cell...

        return cell
    }
        override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
                if indexPath.row == heroes.count - 10 && heroes.count != total{
                    curretPage += 1
                    loadHeroes()
                    print("Carregando mais heróis")
                }
    }
    
}


