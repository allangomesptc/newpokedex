//
//  PokemonDetailVC.swift
//  New Pokedex
//
//  Created by Allan Alvaro Gomes on 21/02/16.
//  Copyright © 2016 allan. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var baseAttack: UILabel!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSUserDefaults.standardUserDefaults().setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
        
        nextEvoImg.hidden = true
        nameLbl.text = pokemon.name
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = UIImage(named: "\(pokemon.pokedexId)")
        currentEvoImg.image = img
        pokemon.downloadPokemonDetails { () -> () in
            //this will be called after download is done.
            self.updateUI()
        }
    }
    
    func updateUI() {

        descriptionLbl.text = pokemon.description
        typeLbl.text = pokemon.type
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        pokedexLbl.text = "\(pokemon.pokedexId)"
        baseAttack.text = pokemon.attack
        
        if pokemon.nextEvolutionId == "" {
            evoLbl.text = "No Evolutions"
            nextEvoImg.hidden = true
        } else {
            nextEvoImg.hidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            var str = "Next Evolution: \(pokemon.nextEvolutionTxt)"
            
            if pokemon.nextEvolutionLvl != "" {
                str += " - LVL \(pokemon.nextEvolutionLvl)"
            }
            evoLbl.text = str
        }
        
    }

    @IBAction func backBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
