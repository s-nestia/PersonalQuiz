//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 07.07.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    var answers: [Answer] = []
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        let currentAnimal = findAnimal()
        resultLabel.text = "Вы - \(currentAnimal.rawValue)"
        definitionLabel.text = currentAnimal.definition
    }
    
    func findAnimal() -> Animal {
        var animalCounter = [Animal : Int]()
        for answer in answers {
            animalCounter[answer.animal] = (animalCounter[answer.animal] ?? 0) + 1
        }
        var currentValue = 0
        var currentKey = Animal.cat
        for (animal, value) in animalCounter {
            if currentValue < value {
                currentValue = value
                currentKey = animal
            }
        }
        return currentKey
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
}
