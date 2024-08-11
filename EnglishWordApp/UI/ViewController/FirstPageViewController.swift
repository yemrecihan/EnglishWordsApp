//
//  FirstPageViewController.swift
//  EnglishWordApp
//
//  Created by Yunus emre cihan on 11.08.2024.
//

import UIKit

class FirstPageViewController: UIViewController {

    @IBOutlet weak var labelWelcome: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func startButton(_ sender: Any) {
        performSegue(withIdentifier: "toHomePageVC", sender: nil)
    }
}
