//
//  ViewController.swift
//  UITableview Swipe Actions
//
//  Created by chaitanya on 1/16/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    var coursesNames = ["Swift","Python","Java","Xamarin","Kotlin","Swift","Python","Java","Xamarin","Kotlin","Swift","Python","Java","Xamarin","Kotlin"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}



// MARK: - UITableView Delegate Methods

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coursesNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.text = coursesNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // MARK: -  Leading Swipe Action Method
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let trashAction = UIContextualAction(style: .normal, title: "Delete") { action, view, completion in
            print("Delete Button Tapped")
            //  Delete Functionality
            self.coursesNames.remove(at: indexPath.row)
            self.myTableView.deleteRows(at: [indexPath], with: .fade)
            completion(true)
        }
        trashAction.backgroundColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        trashAction.image = #imageLiteral(resourceName: "Delete_Red_Icon")
        let configuration = UISwipeActionsConfiguration(actions: [trashAction])
      return configuration
    }
    
    // MARK: -  Trailing Swipe Action Method
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let trashAction = UIContextualAction(style: .normal, title: "Trash") { action, view, completion in
            print("Delete Button Tapped")
            //  Delete Functionality
            self.coursesNames.remove(at: indexPath.row)
            self.myTableView.deleteRows(at: [indexPath], with: .fade)
            completion(true)
        }
        trashAction.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        trashAction.image = #imageLiteral(resourceName: "Delete_Red_Icon")
        let configuration = UISwipeActionsConfiguration(actions: [trashAction])
      return configuration
    }
    
    
}
