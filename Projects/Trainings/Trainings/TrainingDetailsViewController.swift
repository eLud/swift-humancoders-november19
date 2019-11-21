//
//  TrainingDetailsViewController.swift
//  Trainings
//
//  Created by Ludovic Ollagnier on 21/11/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import UIKit

class TrainingDetailsViewController: UIViewController {

    var training: Training?
    @IBOutlet weak var trainingNameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        trainingNameLabel.text = training?.theme
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
