//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Karen He on 3/6/21.
//

import UIKit

class CreationViewController: UIViewController {
    var flashcardsController: ViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerTextField: UITextField!
    
    
    @IBAction func didTapOnBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    
    @IBAction func didTapOnDone(_ sender: Any) {
        let questionText = questionTextField.text
        let answerText = answerTextField.text
        if (questionText == nil || answerText == nil || questionText!.isEmpty || answerText!.isEmpty) {
            // show error alert
            let alert = UIAlertController(title: "Missing text", message: "You need to enter both a question and an answer", preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okayAction)
            present(alert, animated: true)
        } else {
            flashcardsController.updateFlashcard(newQuestion: questionText!, newAnswer: answerText!)
            dismiss(animated: true)
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
