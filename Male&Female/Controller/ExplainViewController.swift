//
//  ExplainViewController.swift
//  Male&Female
//
//  Created by NeilPhung on 8/16/19.
//  Copyright © 2019 NeilPhung. All rights reserved.
//

import UIKit

class ExplainViewController: UIViewController {
    
    var questionNumber : Int!
    var score : Int!
    let allExplain = ExplainBank()
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var explainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        
        if questionNumber <= 3 {
            goBackQuestionView()
        }
        else {
            questionNumber = -1
            goBackQuestionView()
            
        }
        
    }
    
    
    func updateUI(){
        imageView.image = UIImage.init(named: allExplain.listExplain[questionNumber].picture)
        explainLabel.text = allExplain.listExplain[questionNumber].explain
    }
    
    func goBackQuestionView(){
        
        let destinationVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "questionView") as! ViewController
        
        destinationVC.questionNumber = questionNumber + 1
        destinationVC.score = score
        
        present(destinationVC, animated: true, completion: nil)
        
        
        
    }
    
    
}
