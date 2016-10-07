//
//  Pokemon.swift
//  Pokedex
//
//  Created by Anthony Whitaker on 10/4/16.
//  Copyright © 2016 Anthony Whitaker. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: Int!
    private var _height: Int!
    private var _weight: Int!
    private var _attack: Int!
    private var _nextEvolutionText: String!
    private var _pokemonUrl: String!
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    var description: String {
        return _description
    }
    
    var type: String {
        return _type
    }
    
    var defense: Int {
        return _defense
    }
    
    var height: Int {
        return _height
    }
    
    var weight: Int {
        return _weight
    }
    
    var attack: Int {
        return _attack
    }
    
    var nextEvolutionText: String {
        return _nextEvolutionText
    }
    
    
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
        
        _pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
    }
    
    //TODO: Refactor me
    func downloadPokemonDetails(completed: DownloadComplete) {
        let url = URL(string: _pokemonUrl)!
        Alamofire.request(url).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let weight = dict["weight"] as? Int {
                    self._weight = weight
                }
                if let height = dict["height"] as? Int {
                    self._height = height
                }
                
                if let stats = dict["stats"] as? [Dictionary<String, AnyObject>] {
                    for statSet in stats {
                        if let stat = statSet["stat"] as? Dictionary<String, String>{
                            if let name = stat["name"] {
                                if let baseStat = statSet["base_stat"] as? Int {
                                    switch name {
                                    case "attack" : self._attack = baseStat
                                    case "defense" : self._defense = baseStat
                                    default : break
                                    }
                                }
                            }
                        }
                    }
                }
                
                if let types = dict["types"] as? [Dictionary<String, AnyObject>] {
                    var myTypes = [String]()
                    for typeSet in types {
                        if let type = typeSet["type"] as? Dictionary<String, String>{
                            if let name = type["name"] {
                                myTypes.insert(name, at:0) // Types load in reverse order
                            }
                        }
                    }
                    self._type = myTypes.joined(separator: "/").capitalized
                }
                
                if let species = dict["species"] as? Dictionary<String, String> {
                    if let speciesUrl = species["url"] {
                        let url = URL(string: speciesUrl)!
                        Alamofire.request(url).responseJSON { response in
                            let result = response.result
                            
                            if let dict = result.value as? Dictionary<String, AnyObject> {
                                if let flavorTextEntries = dict["flavor_text_entries"] as? [Dictionary<String, AnyObject>] {
                                    for entry in flavorTextEntries {
                                        if let language = entry["language"] as? Dictionary<String, String> {
                                            if let languageName = language["name"] {
                                                if languageName == "en" {
                                                    if let flavorText = entry["flavor_text"] as? String {
                                                        self._description = flavorText.replacingOccurrences(of: "\n", with: " ")
                                                        break;
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                
                                
                                //TODO: One word: Eevee. Ergo, evolutions are not supported at this time.
//                                if let evolutionChain = dict["evolution_chain"] as? Dictionary<String, String> {
//                                    if let evolutionUrl = evolutionChain["url"] {
//                                        let url = URL(string: evolutionUrl)!
//                                        Alamofire.request(url).responseJSON { response in
//                                            let result = response.result
//                                            
//                                            if let dict = result.value as? Dictionary<String, AnyObject> {
//                                            }
//                                        }
//                                    }
//                                }
                                
                            }
                            
                            
                        }
                    }
                }
                
            }
            
            
            
        }
    }
}
