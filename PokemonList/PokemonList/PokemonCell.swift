//
//  PokemonCell.swift
//  PokemonList
//
//  Created by Chinh Dinh on 5/4/20.
//  Copyright © 2020 Chinh Dinh. All rights reserved.
//

import UIKit

class PokemonCell: UITableViewCell {
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var type1Label: UILabel!
    @IBOutlet weak var type2Label: UILabel!
    
    func setupPokemonCell() {
        pokemonImage.layer.cornerRadius = 8
//        type1Label.layer.cornerRadius = 8
//        type2Label.background.layer.cornerRadius = 8
        
//        type1Label.layer.backgroundColor  = UIColor.redColor().CGColor
        type1Label.layer.cornerRadius = 5
        type1Label.layer.masksToBounds = true
    }
}
