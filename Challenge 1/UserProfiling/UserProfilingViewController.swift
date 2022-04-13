//
//  UserProfilingViewController.swift
//  Challenge 1
//
//  Created by Zacky Ilahi Azmi on 12/04/22.
//

import UIKit

class UserProfilingViewController: UIViewController {

    @IBOutlet weak var userGenreBtn: CheckBox!
    @IBOutlet weak var userCountryBtn: CheckBox!
    @IBOutlet weak var userActorBtn: CheckBox!
    @IBOutlet weak var userProdBtn: CheckBox!
    @IBOutlet weak var userDurationBtn: CheckBox!
    @IBOutlet weak var userMoviesBtn: CheckBox!
    @IBOutlet weak var userSeriesBtn: CheckBox!
    
    
    @IBOutlet weak var userNextBtn: GradientButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func userNextBtn(_ sender: UIButton) {
        
        let storyBoard = UIStoryboard(name: "UserProfilingSecondView", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "UserProfilingSecondViewController")
        self.present(viewController, animated: true, completion: nil)
    }
}


