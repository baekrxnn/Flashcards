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
    
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func didTapOnPrev(_ sender: Any) {
        currentIndex -= 1
        updateLabels()
        updateNextPrevButtons()
    }
    @IBAction func didTapOnNext(_ sender: Any) {
        currentIndex += 1
        updateLabels()
        updateNextPrevButtons()
    }
    
    
    var cardStack = [Flashcard]()
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateFlashcard(newQuestion: "1+\"1\"=?", newAnswer: "\"11\"")
    }

    func updateNextPrevButtons() {
        // disable the next button if we are at the last card in the array
        if (currentIndex == cardStack.count-1) {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
        
        // disable the prev button if we are at the first card in the array
        if (currentIndex == 0) {
            prevButton.isEnabled = false
        } else {
            prevButton.isEnabled = true
        }
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
        // add it to the array of flashcards (the cardStack)
        cardStack.append(newFlashcard)
        if cardStack.count == 1 {
            currentIndex = 0
        } else {
            currentIndex += 1
        }
//        print("flashcard added")
//        print("there are now \(cardStack.count) flashcards in the stack")
//        print("current index: \(currentIndex)")
        // update labels
        updateLabels()
        // un-hide the question view so that we can see the question again
        question.isHidden = false
        // update buttons
        updateNextPrevButtons()
    }
    
    func updateLabels() {
        // get the current card
        let currentFlashcard = cardStack[currentIndex]
        // actually update them
        question.text = currentFlashcard.question
        answer.text = currentFlashcard.answer
        // make the question show up first
        question.isHidden = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let creationController = navigationController.topViewController as! CreationViewController
        creationController.flashcardsController = self
    }
}


