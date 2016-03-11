//
//  GameViewController.swift
//  Hangman
//
//  Created by Shawn D'Souza on 3/3/16.
//  Copyright © 2016 Shawn D'Souza. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var secretWord: UILabel!
    var chosen = [Character]()
    var phrase = ""
    
    @IBOutlet weak var hangmanImage: UIImageView!
    var imageIndex = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let hangmanPhrases = HangmanPhrases()
        phrase = hangmanPhrases.getRandomPhrase()
        print(phrase)
        secretWord.text = ""
        
        for c in phrase.characters {
            
            if c == " " {
                secretWord.text! += "  "
            }
            else {
                secretWord.text! += "_  "
            }
        }
    }
    
    @IBAction func letterGuess(sender: UIButton) {
        
        
        sender.enabled = false
        let newC = Character(sender.currentTitle!)
        if(!phrase.characters.contains(newC)) {
            imageIndex++
            hangmanImage.image = UIImage(named: "hangman\(min(max(1, imageIndex), 7)).gif")
        }
        chosen.append(newC)
        var newSecretWord = ""
        for c in phrase.characters {
            if c == " " {
                newSecretWord += "  "
            }
            else if (chosen.contains(c)){
                newSecretWord += String(c) + "  "
            }
            else {
                newSecretWord += "_  "
            }
        }
        secretWord.text = newSecretWord
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
