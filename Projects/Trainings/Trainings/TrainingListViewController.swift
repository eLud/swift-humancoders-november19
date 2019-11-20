//
//  TrainingListViewController.swift
//  Trainings
//
//  Created by Ludovic Ollagnier on 20/11/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import UIKit

class TrainingListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let manager = TrainingManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "BasicCellTableViewCell", bundle: nil), forCellReuseIdentifier: "basicCell")

        tableView.dataSource = self
        tableView.delegate = self
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

extension TrainingListViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let identifier: String

        switch indexPath.section {
        case 0:
            identifier = "basicCell"
        case 1:
            identifier = "helloCell"
        default:
            fatalError("Must provide an identifier")
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = "\(indexPath)"
        return cell
    }
}

extension TrainingListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Première section"
        case 1:
            return "Hello"
        default:
            return nil
        }
    }

}
