//
//  InfoPokemonViewController.swift
//  PokemonList
//
//  Created by Chinh Dinh on 5/7/20.
//  Copyright © 2020 Chinh Dinh. All rights reserved.
//

import UIKit

class InfoPokemonViewController: UIViewController {
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    var pokemonImageUrl =  String()
    var pokemonName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: pokemonImageUrl)
        let data = try? Data(contentsOf: url!)
        pokemonNameLabel.text = pokemonName
        pokemonImageView.image = UIImage(data: data!)
        // Do any additional setup after loading the view.
    }
    


}
