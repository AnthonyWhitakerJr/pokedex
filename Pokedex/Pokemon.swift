//
//  Pokemon.swift
//  Pokedex
//
//  Created by Anthony Whitaker on 10/4/16.
//  Copyright © 2016 Anthony Whitaker. All rights reserved.
//

import Foundation

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
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
    }
}
