//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Андрей Бородкин on 02.07.2021.
//

import UIKit

class AthleteFormViewController: UIViewController {

    var athlete: Athlete?
    var athleteDelegate: returnAthleteDelegate!
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var leagueTextField: UITextField!
    @IBOutlet var teamTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        
    }
    
    
    func updateView() {
        if let athlete = athlete {
            nameTextField.text = athlete.name
            ageTextField.text = String(athlete.age)
            leagueTextField.text = athlete.league
            teamTextField.text = athlete.team
        }
    }

    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
        guard let name = nameTextField.text,
              let ageString = ageTextField.text,
              let age = Int(ageString),
              let league = leagueTextField.text,
              let team = teamTextField.text else {return}
        
       athlete = Athlete(name: name, age: age, league: league, team: team)
    
        athleteDelegate.returnAthlete(athlete: athlete!)
        navigationController?.popViewController(animated: true)}
}


protocol returnAthleteDelegate {
    func returnAthlete(athlete: Athlete)
}
