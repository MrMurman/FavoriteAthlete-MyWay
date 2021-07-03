import UIKit

enum Action {
    case add, edit
}

class AthleteTableViewController: UITableViewController {
    
    struct PropertyKeys {
        static let athleteCell = "AthleteCell"
    }

    var athletes: [Athlete] = [Athlete(name: "Andrew", age: 30, league: "SuperSport", team: "Rocket")]
    
    var newAthlete: Athlete?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        athletes.append(Athlete(name: "Andrew", age: 30, league: "SuperSport", team: "Rocket"))
        
      
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return athletes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.athleteCell, for: indexPath)
        
        let athlete = athletes[indexPath.row]
        cell.textLabel?.text = athlete.name
        cell.detailTextLabel?.text = athlete.description
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        instantiateStoryboard(action: .edit, indexPath: indexPath)

        
    }
    
    @IBAction func addAthlete(_ sender: UIBarButtonItem) {
       
        instantiateStoryboard(action: .add, indexPath: nil)

    }

    
    
    func getAthleteInfo(athlete: Athlete) {
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
                   athletes[selectedIndexPath.row] = athlete
               } else {
                   athletes.append(athlete)
               }
        tableView.reloadData()
    }
}


extension AthleteTableViewController: returnAthleteDelegate {
    func returnAthlete(athlete: Athlete) {
        newAthlete = athlete
        
        guard let newAthlete = newAthlete else {
            return
        }

        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            athletes[selectedIndexPath.row] = newAthlete
               } else {
                   athletes.append(newAthlete)
               }
    }
    
    func instantiateStoryboard(action: Action, indexPath: IndexPath?) {
      
        if let vc = storyboard?.instantiateViewController(withIdentifier: "AthleteForm") as? AthleteFormViewController {
            switch action {
            case .add:
                vc.title = "Add new Athlete"
            case .edit:
                guard let indexPath = indexPath else {
                    return
                }

                vc.athlete = athletes[indexPath.row]
                vc.title = athletes[indexPath.row].name
            }

            vc.athleteDelegate = self
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
