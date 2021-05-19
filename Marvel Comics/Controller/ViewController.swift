//
//  ViewController.swift
//  Marvel Comics
//
//  Created by Cassia Franco on 18/05/21.
//  Copyright © 2021 Yasmin Oliveira. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var tfName: UITextField!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            
        }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        tfName.resignFirstResponder()
        let vc = segue.destination as! HeroesTableViewController
        vc.name = tfName.text
    }
    }

