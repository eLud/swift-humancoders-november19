//
//  ViewController.swift
//  TrainingCD
//
//  Created by Ludovic Ollagnier on 22/11/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func create(_ sender: UIButton) {

        let context = CoreDataStack.shared.persistentContainer.viewContext

        let training = Training(context: context)
        training.theme = "SwiftUI"
        training.duration = 5

        let trainer = Trainer(context: context)
        trainer.firstName = "Ludovic"

        training.trainer = trainer

        CoreDataStack.shared.saveContext()
    }
    
    @IBAction func read(_ sender: UIButton) {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Training> = Training.fetchRequest()

        let predicate = NSPredicate(format: "theme CONTAINS %@", "SwiftUI")
        fetchRequest.predicate = predicate

        let trainings = try? context.fetch(fetchRequest)
        label.text = trainings?.first?.theme
    }
}

