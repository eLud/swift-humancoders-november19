//
//  RedViewController.swift
//  Trainings
//
//  Created by Ludovic Ollagnier on 22/11/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import UIKit
import SwiftyJSON

class RedViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func async(_ sender: UIButton) {

        for i in 0...1000 {
            DispatchQueue.global(qos: .default).async {
                for i in 0...100000 {
                    let p = i*i
                }
            }
        }
    }

    @IBAction func getImage(_ sender: UIButton) {

        let url = URL(string: "https://www.ayokasystems.com/wp-content/uploads/Apple-Swift-Icon.jpg")

        let session = URLSession.shared
        let task = session.dataTask(with: url!) { (data, urlResponse, error) in

            guard error == nil else { return }
            guard let data = data, let image = UIImage(data: data) else { return }

            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }

        task.resume()
    }
}
