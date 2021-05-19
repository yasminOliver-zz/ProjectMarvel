//
//  HeroesTableViewController.swift
//  Marvel Comics
//
//  Created by Cassia Franco on 16/05/21.
//  Copyright © 2021 Yasmin Oliveira. All rights reserved.
//

import UIKit

class HeroesTableViewController: UITableViewController {
    
    var name: String?
    var heroes: [Hero] = []
    var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    var loadingHeroes = false
    var currentPage = 0
    var total = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Buscando Heroes aguarde... "
        loadHeroes()
    }
    
   override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    func loadHeroes() {
        loadingHeroes = true
        Service.loadHeros(name: name, page: currentPage) { (info) in
            if let info = info {
                self.heroes += info.data.results
                self.total = info.data.total
                print("Total:",self.total, "Já incluido:", self.heroes.count)
                DispatchQueue.main.async {
                    self.loadingHeroes = false
                    self.label.text = "Não foram encontrados hérois com o nome \(self.name!)."
                    self.tableView.reloadData()
                }
            }
        }
    }
    //MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundView = heroes.count == 0  ? label: nil
        return heroes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell ", for: indexPath)
        
        return cell
    }
}
