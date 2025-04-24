//
//  ViewController.swift
//  Project2
//
//  Created by Henry Chavira on 10/18/23.
//

import UIKit

class CharactersViewController: UITableViewController {
    
    var characterStore: CharacterStore!
    
    // base SPECIAL should be 28, which is level 1, anything higher increases level, max stats is 10 for all special stats, hp should be based on how much endurance a character has. convert hp and level, when character is clicked on should bring up statsviewcontrolller to change/randomize SPECIAL

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterStore.allCharacters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
        
        let character = characterStore.allCharacters[indexPath.row]
        
        cell.nameLabel.text = character.name
        
        cell.specialLabel.text = "Total SPECIAL:\(character.totalSpecial)"
        cell.hitpointsLabel.text = "HP:\(character.hitpoints)"
        cell.levelLabel.text = "Lvl:\(character.level)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)  {
        if editingStyle == .delete {
            let character = characterStore.allCharacters[indexPath.row]
            
            characterStore.removeCharacter(character)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        characterStore.moveCharacter(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showCharacter":
            if let row = tableView.indexPathForSelectedRow?.row {
                let character = characterStore.allCharacters[row]
                
                let statsViewController = segue.destination as! StatsViewController
                statsViewController.character = character
            }
            // helps identify errors sooner to catch segue identifier errors
        default:
            preconditionFailure("Unexpected Segue Failure")
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    @IBAction func addNewCharacter(_ sender: UIBarButtonItem) {
        if let newCharacter = characterStore.createCharacter() {
            if let index = characterStore.allCharacters.firstIndex(of: newCharacter)
            {
                let indexPath = IndexPath(row: index, section: 0)
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
        }
    }


}
