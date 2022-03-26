//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var imageAnimalLabel: UILabel!
    @IBOutlet weak var descriptionAnimalLabel: UILabel!
    
    var answersChosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        findAnimal()

    }
    
    private func findAnimal()  {
        
        var animalsChosen: [Animal: Int] = [:]
        let animals = answersChosen.map { $0.animal }
        
        for animal in animals {
            if let animalsChosenCount = animalsChosen[animal] {
                animalsChosen.updateValue(animalsChosenCount + 1, forKey: animal)
            } else {
                animalsChosen[animal] = 1
            }
        }
        
        guard let mostChosenAnimal = animalsChosen
            .sorted(by: { $0.value > $1.value })
            .first?
            .key else { return }
        
        updateUI(mostChosenAnimal)
    }
    
    private func updateUI(_ animal: Animal) {
        imageAnimalLabel.text = "Вы - \(animal.rawValue)!"
        descriptionAnimalLabel.text = animal.definition
    }
}

