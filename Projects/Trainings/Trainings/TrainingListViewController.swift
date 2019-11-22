//
//  TrainingListViewController.swift
//  Trainings
//
//  Created by Ludovic Ollagnier on 20/11/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import UIKit
import Combine

class TrainingListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var manager = TrainingManager(demoData: true)
    var notifcationCancellable: AnyCancellable?

    ///This reference will hold the diffable dataSource for the tableView
    /// It will use instances from the Style enum to define sections and trainings to provide data for rows
    ///Both types must be Hashable
    var diffableDataSource: UITableViewDiffableDataSource<Training.Style, Training>?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "BasicCellTableViewCell", bundle: nil), forCellReuseIdentifier: "basicCell")

//        tableView.dataSource = self
//        tableView.delegate = self

        configureDiffableDatasource()

//        NotificationCenter.default.addObserver(forName: Notification.Name("modelUpdated"), object: nil, queue: OperationQueue.main) { (notif) in
//            self.populateDiffableDataSource(animated: true)
//        }

        let hugo = Trainer(firstName: "Hugo Lepetit")
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            self.manager.add(Training(theme: "Ruby", duration: 3, isFull: false, trainer: hugo, style: .onSite))
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4)) {
            self.manager.add(Training(theme: "Ruby on rails", duration: 3, isFull: false, trainer: hugo, style: .remote))
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
            self.manager.add(Training(theme: "Tests avec Ruby on rails", duration: 3, isFull: false, trainer: hugo, style: .onSite))
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(6)) {
            let removed = self.manager.list[0]
            self.manager.remove(removed)
            self.manager.add(removed)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(7)) {
            self.manager.shuffle()
        }

        notifcationCancellable = NotificationCenter.default.publisher(for: Notification.Name("modelUpdated"))
            .sink { (notif) in
            self.populateDiffableDataSource(animated: true)
        }

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        populateDiffableDataSource()
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "form" {

            guard let destination = segue.destination as? ViewController else { fatalError("I want a ViewController") }
            destination.manager = self.manager

        } else if segue.identifier == "details" {

            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            guard let destination = segue.destination as? TrainingDetailsViewController else { fatalError("I want a TrainingDetailsViewController") }

            let trainingToPass: Training

            switch indexPath.section {
            case 0:
                let trainings = manager.list.filter({$0.style == .onSite})
                trainingToPass = trainings[indexPath.row]
            case 1:
                let trainings = manager.list.filter({$0.style == .remote})
                trainingToPass = trainings[indexPath.row]
            default:
                fatalError()
            }
            destination.training = trainingToPass
        }
    }

}

extension TrainingListViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        switch section {
        case 0:
            return manager.list.filter({$0.style == .onSite}).count
        case 1:
            return manager.list.filter({$0.style == .remote}).count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let identifier: String
        let training: Training

        switch indexPath.section {
        case 0:
            identifier = "basicCell"
            training = manager.list.filter({$0.style == .onSite})[indexPath.row]
        case 1:
            identifier = "helloCell"
            training = manager.list.filter({$0.style == .remote})[indexPath.row]
        default:
            fatalError("Must provide an identifier")
        }

         let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = training.theme
        cell.detailTextLabel?.text = "\(training.duration) jours"
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

//Mark: - DiffableDataSource demo
extension TrainingListViewController {
    func populateDiffableDataSource(animated: Bool = false) {
        var snapshot = NSDiffableDataSourceSnapshot<Training.Style, Training>()
        snapshot.appendSections([.onSite, .remote])
        snapshot.appendItems(manager.list.filter( {$0.style == .onSite} ), toSection: .onSite)
        snapshot.appendItems(manager.list.filter( {$0.style == .remote} ), toSection: .remote)
        diffableDataSource?.apply(snapshot, animatingDifferences: animated)
    }

    func configureDiffableDatasource() {

        //We don't forget to really initialise our diffable dataSource
         diffableDataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { (tableView, indexPath, training) -> UITableViewCell? in

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
            cell.textLabel?.text = training.theme
            cell.detailTextLabel?.text = "\(training.duration) jours"
             return cell
         })
    }
}
