//
//  ViewController.swift
//  Flashcards
//
//  Created by Karen He on 2/20/21.
//

import UIKit

struct Flashcard {
    var question: String
    var answer: String
}

class ViewController: UIViewController {

    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var question: UILabel!
    
    var cardStack = [Flashcard]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func didTapOnFlashcard(_ sender: Any) {
        if question.isHidden == false {
            question.isHidden = true
        } else {
            question.isHidden = false
        }
    }
    
    func updateFlashcard(newQuestion: String, newAnswer: String) {
        // make a new flashcard
        let newFlashcard = Flashcard(question: newQuestion, answer: newAnswer)
        question.text = newFlashcard.question
        answer.text = newFlashcard.answer
        // add it to the array of flashcards (the cardStack)
        cardStack.append(newFlashcard)
        // un-hide the question view so that we can see the question again
        question.isHidden = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let creationController = navigationController.topViewController as! CreationViewController
        creationController.flashcardsController = self
    }
}


