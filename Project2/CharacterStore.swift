//
//  CharacterStore.swift
//  Project2
//
//  Created by Henry Chavira on 10/18/23.
//

import UIKit

class CharacterStore {
    
    init () {
        do {
            let data = try Data(contentsOf: characterArchiveURL)
            let unarchiver = PropertyListDecoder()
            let characters = try unarchiver.decode([Character].self, from: data)
            allCharacters = characters
        } catch {
            print("Error reading in saved characters: \(error)")
        }
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(saveCharacters), name: UIScene.didEnterBackgroundNotification, object: nil)
    }
    
    var allCharacters = [Character]()

    
    let characterArchiveURL: URL = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docuementDirectory = documentsDirectories.first!
        return docuementDirectory.appendingPathComponent("characters.plist")
    }()
    
    @discardableResult func createCharacter() -> Character? {
        let newCharacter = Character(random: true)
        
        let totalStats = newCharacter.strength + newCharacter.perception + newCharacter.endurance + newCharacter.charisma + newCharacter.intelligence + newCharacter.agility + newCharacter.luck

        if totalStats >= 28 {
            allCharacters.append(newCharacter)
            return newCharacter
        } else {
            return nil
        }
    }
    
    func removeCharacter(_ character: Character) {
        if let index = allCharacters.firstIndex(of: character) {
            allCharacters.remove(at: index)
        }
    }
    
    func moveCharacter(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        let movedCharacter = allCharacters[fromIndex]
        
        allCharacters.remove(at: fromIndex)
        
        allCharacters.insert(movedCharacter, at: toIndex)
    }
    
    
    @objc func saveCharacters() -> Bool {
        print("Saving characters to \(characterArchiveURL)")
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(allCharacters)
            
            try data.write(to: characterArchiveURL, options: [.atomic])
            
            print("Saved all of the characters")
            return true
            
        } catch {
            print("Error encoding all Characters: \(error)")
            return false
        }
    }
}
