//
//  ViewController.swift
//  PokemonList
//
//  Created by Chinh Dinh on 5/4/20.
//  Copyright © 2020 Chinh Dinh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var pokemons = [Pokemon]()
    var pokeImage: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        requestPokemon()
        setupUI()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pokemon = pokemons[indexPath.row]
        let infoPokemonView = storyboard?.instantiateViewController(withIdentifier: "InfoPokemon") as! InfoPokemon
        infoPokemonView.namePokemon = pokemon.name
        navigationController?.pushViewController(infoPokemonView, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell") as! PokemonCell
        let pokemon = pokemons[indexPath.row]
        let url = URL(string: pokemon.pokemonImage)
        
        let data = try? Data(contentsOf: url!)
        cell.pokemonImage.image = UIImage(data: data!)
        cell.nameLabel.text = pokemon.name
        cell.type1Label.text = pokemon.type1
        cell.type2Label.text = pokemon.type2
        return cell
    }
    
    func setupUI() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PokemonCell", bundle: nil), forCellReuseIdentifier: "PokemonCell")
        tableView.rowHeight = 80
        tableView.delegate = self
        
    }
    
    func requestPokemon() {
        let url = URL(string: "https://www.pokemon.com/us/api/pokedex/kalos?fbclid=IwAR2nHjcrxx_v5LizjedTG5X4EmmpiuHEqEXiJxFDCHJrV1wyh-VlPxnpMc0")!
        let task = URLSession.shared.dataTask(with: url) { data, respone, error in
            let jsons = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [[String: Any]]
            
            var pokemons = [Pokemon]()
            for json in jsons {
                let type = json["type"] as! [String]
                var type1 = String()
                var type2 = String()
                if type.count == 1 {
                    type1 = type[0]
                    type2 = ""
                }
                if type.count == 2 {
                    type1 = type[0]
                    type2 = type[1]
                }
                let name = json["name"] as! String
                let thumbnailImage = json["ThumbnailImage"] as! String
                let pokemon = Pokemon(name: name, pokemonImage: thumbnailImage, type1: type1, type2: type2)
                pokemons.append(pokemon)
                for i in 0..<pokemons.count - 1 {
                    if pokemons[i].name == pokemons[i + 1].name {
                        pokemons.removeLast()
                    }
                }
            }
            self.pokemons = pokemons
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        task.resume()
    }
}

