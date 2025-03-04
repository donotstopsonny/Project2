//
//  ViewController.swift
//  Project2
//
//  Created by Hyeongchae Son on 7/14/24.
//

import UIKit
 
class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var numberOfBeingAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
        
    }
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased() + " / Score now is : \(score)"
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var message: String?
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            message = "your score is \(score)"
        }else {
            title = "Wrong"
            score -= 1
            message = "your score is \(score), and the correct answer is \(countries[correctAnswer].uppercased())"
        }
        numberOfBeingAsked += 1

        if numberOfBeingAsked < 10 {
            let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
            
        } else {
            let ac = UIAlertController(title: "Finished!", message: "Your score is \(score))", preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "Play Again", style: .default, handler: askQuestion))
            
            score = 0
            numberOfBeingAsked = 0
            
            present(ac, animated: true)
        }
    }
    
}

