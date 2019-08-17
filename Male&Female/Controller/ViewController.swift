//
//  ViewController.swift
//  Male&Female
//
//  Created by NeilPhung on 8/16/19.
//  Copyright © 2019 NeilPhung. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    //MARK : - IBOutlet
    let allQuestions = QuestionBank()
    let allSould = Sound()
    let allExplainBank = ExplainBank()
    var audioPlayer : AVAudioPlayer!
    var pickedAnswer : Bool = false
    var score: Int = 0
    var questionNumber: Int  = 0
    var explainNumber: Int = 0
    
    @IBOutlet weak var questionImageView: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()

    }
    
    //MARK: - IBAction
    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if sender.tag == 1 {
            pickedAnswer = true
            
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        questionNumber = questionNumber + 1
        nextQuestion()
      

    }
    
    //MARK: - Helper Method
    func nextQuestion() {
        if questionNumber <= 4 {
            questionImageView.image = UIImage.init(named: allQuestions.list[questionNumber].questionImage)
            updateUI()
        }
        else {
           let alert = UIAlertController(title: "Hoàn Tất Câu Hỏi", message: "Bắt đầu lại câu  ", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        
        
    }
    
    func startOver () {
        questionNumber = 0
        nextQuestion()
    }
    

    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer {
            playSound(souldString: allSould.sound[0])
            ProgressHUD.showSuccess("Hoan Hô !")
            score = score + 1
            
            
        }
        else {
            playSound(souldString: allSould.sound[1])
            ProgressHUD.showError("Sai Rồi Nhé!")
            goToExplain()
        }
    }
    
    func updateUI(){
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = ("\(questionNumber + 1)/6")
        progressBar.frame.size.width = (view.frame.size.width / 5) * CGFloat(questionNumber + 1)
    }

    
    func goToExplain(){
        let destinationVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "explainView") as! ExplainViewController
        
        destinationVC.questionNumber = questionNumber
        destinationVC.score = score
        present(destinationVC, animated: true, completion: nil)

    }
    
    func playSound(souldString: String) {
        let soundURL = Bundle.main.url(forResource: souldString, withExtension: "mp3")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
            audioPlayer.play()
        }
        catch {
            
        }
    }

}

