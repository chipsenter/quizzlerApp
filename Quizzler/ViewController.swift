//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startOver()
        //nextQuestion()
        //This does the same as above line
        //let firstQuestion = allQuestions.list[0]
        //questionLabel.text = firstQuestion.questionText
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        
        nextQuestion()
        
        updateUI()
    }
    
    
    func updateUI() {
        if allQuestions.list.count > questionNumber {
         questionLabel.text = allQuestions.list[questionNumber].questionText
        }
        scoreLabel.text = "Score \(score)"
        progressLabel.text = "\(questionNumber + 1) / 13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
    }
    

    func nextQuestion() {
        if questionNumber < 12 {
            questionNumber = questionNumber + 1
        }else{
            
            let alert = UIAlertController(title: "Finish", message: "You finished all the questions, do you want to restart?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                
                self.startOver()
                
                
            })
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
            
        }

    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        
        if correctAnswer == pickedAnswer {
            
            // This will show a modal with Correct pop-up
            
            ProgressHUD.showSuccess("Correct")
            
            print("Yeah,Spot On!")
            
            score += 1
            // score = score + 1
        }
        else {
            ProgressHUD.showError("That's Incorrect!")
            
            print("You Suck!")
        }
        
    }
    
    
    func startOver() {
       
        questionNumber = 0
        score = 0
        updateUI()
        
    }
    

    
}
