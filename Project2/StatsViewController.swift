//
//  StatsViewController.swift
//  Project2
//
//  Created by Henry Chavira on 10/18/23.
//

import UIKit

class StatsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var strengthField: UITextField!
    @IBOutlet var strengthLabel: UILabel!
    
    @IBOutlet var perceptionField: UITextField!
    @IBOutlet var perceptionLabel: UILabel!

    @IBOutlet var enduranceField: UITextField!
    @IBOutlet var enduranceLabel: UILabel!

    @IBOutlet var charismaField: UITextField!
    @IBOutlet var charismaLabel: UILabel!

    @IBOutlet var intelligenceField: UITextField!
    @IBOutlet var intelligenceLabel: UILabel!

    @IBOutlet var agilityField: UITextField!
    @IBOutlet var agilityLabel: UILabel!

    @IBOutlet var luckField: UITextField!
    @IBOutlet var luckLabel: UILabel!

    var characterStore: CharacterStore?
    
    var character: Character! {
        didSet {
            navigationItem.title = "-- \(character.name) SPECIAL --"
            let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.green]
            navigationController?.navigationBar.titleTextAttributes = textAttributes
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0
        return formatter
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        characterStore = CharacterStore()
        
        nameField.layer.borderColor = UIColor.green.cgColor
        
        nameField.layer.borderWidth = 1.0
        
        strengthField.layer.borderColor = UIColor.green.cgColor
        
        strengthField.layer.borderWidth = 1.0
        
        perceptionField.layer.borderColor = UIColor.green.cgColor
        
        perceptionField.layer.borderWidth = 1.0
        
        enduranceField.layer.borderColor = UIColor.green.cgColor
        
        enduranceField.layer.borderWidth = 1.0
        
        charismaField.layer.borderColor = UIColor.green.cgColor
        
        charismaField.layer.borderWidth = 1.0
        
        intelligenceField.layer.borderColor = UIColor.green.cgColor
        
        intelligenceField.layer.borderWidth = 1.0
        
        agilityField.layer.borderColor = UIColor.green.cgColor
        
        agilityField.layer.borderWidth = 1.0
        
        luckField.layer.borderColor = UIColor.green.cgColor
        
        luckField.layer.borderWidth = 1.0
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = character.name
        strengthField.text = numberFormatter.string(from: NSNumber(value: character.strength))
        
        perceptionField.text = numberFormatter.string(from: NSNumber(value: character.perception))
        
        enduranceField.text = numberFormatter.string(from: NSNumber(value: character.endurance))
        
        charismaField.text = numberFormatter.string(from: NSNumber(value: character.charisma))
        
        intelligenceField.text = numberFormatter.string(from: NSNumber(value: character.intelligence))
        
        agilityField.text = numberFormatter.string(from: NSNumber(value: character.agility))
        
        luckField.text = numberFormatter.string(from: NSNumber(value: character.luck))
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        view.endEditing(true)
        
        character.name = nameField.text ?? ""
        
        
        if let strengthText = strengthField.text, // explicity unwrap
           let value = numberFormatter.number(from: strengthText) {
            character.strength = value.intValue
        } else {
            character.strength = 0
        }
        
        if let perceptionText = perceptionField.text, // explicity unwrap
           let value = numberFormatter.number(from: perceptionText) {
            character.perception = value.intValue
        } else {
            character.perception = 0
        }
        
        if let enduranceText = enduranceField.text, // explicity unwrap
           let value = numberFormatter.number(from: enduranceText) {
            character.endurance = value.intValue
        } else {
            character.endurance = 0
        }
        
        if let charismaText = charismaField.text, // explicity unwrap
           let value = numberFormatter.number(from: charismaText) {
            character.charisma = value.intValue
        } else {
            character.charisma = 0
        }
        
        if let intelligenceText = intelligenceField.text, // explicity unwrap
           let value = numberFormatter.number(from: intelligenceText) {
            character.intelligence = value.intValue
        } else {
            character.intelligence = 0
        }
        
        if let agilityText = agilityField.text, // explicity unwrap
           let value = numberFormatter.number(from: agilityText) {
            character.agility = value.intValue
        } else {
            character.agility = 0
        }
        
        if let luckText = luckField.text, // explicity unwrap
           let value = numberFormatter.number(from: luckText) {
            character.luck = value.intValue
        } else {
            character.luck = 0
        }
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    @IBAction func backgroudTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    @IBAction func randomizeStats(_ sender: UIButton) {
        if characterStore != nil {
            
            let randomStrength = Int.random(in: 1..<11)
            let randomPerception = Int.random(in: 1..<11)
            let randomEndurance = Int.random(in: 1..<11)
            let randomCharisma = Int.random(in: 1..<11)
            let randomIntelligence = Int.random(in: 1..<11)
            let randomAgility = Int.random(in: 1..<11)
            let randomLuck = Int.random(in: 1..<11)
            
            let fnames = [
                "James", "Emma", "Liam", "Olivia", "Noah", "Sophia", "Benjamin", "Ava", "William", "Isabella",
                "Ethan", "Mia", "Alexander", "Charlotte", "Henry", "Amelia", "Samuel", "Harper", "Olivia", "Aiden",
                "Olivia", "Michael", "Emily", "Daniel", "Sophia", "Matthew", "Grace", "Benjamin", "Abigail", "Samuel",
                "Ava", "Joseph", "Lily", "Jacob", "Chloe", "William", "Harper", "Evelyn", "Alexander", "Mia", "Vance"
            ]

            let lnames = [
                "Smith", "Johnson", "Brown", "Davis", "Wilson", "Jones", "Anderson", "Miller", "Martin", "Taylor",
                "White", "Clark", "Hall", "Harris", "Thomas", "Lee", "Walker", "Young", "King", "Wright",
                "Rodriguez", "Martinez", "Robinson", "Scott", "Nelson", "Hall", "Allen", "Sanchez", "Green", "Hill",
                "Murphy", "Bailey", "Turner", "Morgan", "Cooper", "Perez", "Simmons", "Collins", "Torres", "Hughes", "Chavira", "Andersen", "Holt"
            ]
            
            let randomFname = fnames.randomElement() ?? ""
            let randomLname = lnames.randomElement() ?? ""
            
            nameField.text = "\(randomFname) \(randomLname)"
            
            strengthField.text = "\(randomStrength)"
            perceptionField.text = "\(randomPerception)"
            enduranceField.text = "\(randomEndurance)"
            charismaField.text = "\(randomCharisma)"
            intelligenceField.text = "\(randomIntelligence)"
            agilityField.text = "\(randomAgility)"
            luckField.text = "\(randomLuck)"
            
        }
        
    }

}
       
