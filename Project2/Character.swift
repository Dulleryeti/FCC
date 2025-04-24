//
//  Character.swift
//  Project2
//
//  Created by Henry Chavira on 10/18/23.
//

import UIKit

class Character: Equatable, Codable {
    var name: String
    var strength: Int
    var perception: Int
    var endurance: Int
    var charisma: Int
    var intelligence: Int
    var agility: Int
    var luck: Int
        

    var level: Int {
        let totalStats = strength + perception + endurance + charisma + intelligence + agility + luck
        return totalStats - 28 + 1
    }
    
    var totalSpecial: Int {
        let totalSpecial = strength + perception + endurance + charisma + intelligence + agility + luck
        return totalSpecial
    }
    
    var hitpoints: Int {
        let baseHP = 80
        let enduranceHP = endurance * 5
        let levelHP = (level - 1) * (Int(endurance) / 2 + 2)
        
        return baseHP + enduranceHP + levelHP
    }

    init(name: String, strength: Int, perception: Int, endurance: Int, charisma: Int, intelligence: Int, agility: Int, luck: Int) {
        self.name = name
        self.strength = strength
        self.perception = perception
        self.endurance = endurance
        self.charisma = charisma
        self.intelligence = intelligence
        self.agility = agility
        self.luck = luck
    }
    
    convenience init(random: Bool = false) {
        if random {
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
            
            let randomFname = fnames.randomElement()!
            let randomLname = lnames.randomElement()!
            
            let randomName = "\(randomFname) \(randomLname)"
            
            let randomStrength = Int.random(in: 1..<11)
            let randomPerception = Int.random(in: 1..<11)
            let randomEndurance = Int.random(in: 1..<11)
            let randomCharisma = Int.random(in: 1..<11)
            let randomIntelligence = Int.random(in: 1..<11)
            let randomAgility = Int.random(in: 1..<11)
            let randomLuck = Int.random(in: 1..<11)
            
            self.init(name: randomName, strength: randomStrength, perception: randomPerception, endurance: randomEndurance, charisma: randomCharisma, intelligence: randomIntelligence, agility: randomAgility, luck: randomLuck)
            
        } else {
            self.init(name: "", strength: 0, perception: 0, endurance: 0, charisma: 0, intelligence: 0, agility: 0, luck: 0)
        }
    }
    
    static func ==(lhs: Character, rhs: Character) -> Bool {
        return lhs.name == rhs.name && lhs.strength == rhs.strength && lhs.perception == rhs.perception && lhs.endurance == rhs.endurance && lhs.charisma == rhs.charisma && lhs.intelligence == rhs.intelligence && lhs.agility == rhs.agility && lhs.luck == rhs.luck
    }
    
}
