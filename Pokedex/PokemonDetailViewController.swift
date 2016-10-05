//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by Anthony Whitaker on 10/5/16.
//  Copyright © 2016 Anthony Whitaker. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(pokemon)
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        nameLabel.text = pokemon.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
