//
//  ViewController.swift
//  Flashcards
//
//  Created by Karen He on 2/20/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var question: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func didTapOnFlashcard(_ sender: Any) {
        question.isHidden = true
    }
    
    func updateFlashcard(newQuestion: String, newAnswer: String) {
        question.text = newQuestion
        answer.text = newAnswer
    }
}


