//
//  InfoPokemon.swift
//  PokemonList
//
//  Created by Chinh Dinh on 5/5/20.
//  Copyright © 2020 Chinh Dinh. All rights reserved.
//

import UIKit

class InfoPokemon: ViewController {
    
    
    @IBOutlet weak var namePokemonLabel: UILabel!
    
    var namePokemon = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        namePokemonLabel.text = namePokemon
    }
}
