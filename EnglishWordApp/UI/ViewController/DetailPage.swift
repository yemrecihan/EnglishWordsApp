

import UIKit

class DetailPage: UIViewController {
    
    var level : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("DetailPage level (viewDidLoad): \(level ?? "No level")") // Debugging için eklendi
       
    }
  
    
    @IBAction func ögrenButton(_ sender: Any) {
        guard let level = level else {
            print("Level is nil")
            return
        }
        performSegue(withIdentifier: "toLearnWord", sender: level)
    }
   
    
    @IBAction func testButton(_ sender: Any) {
        guard let level = level else  {
            print("Level is nil")
            return
        }
        performSegue(withIdentifier: "toTestPage", sender: level)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toLearnWord",
           let destinationVC = segue.destination as? LearnWord,
           let level = sender as? String {
            destinationVC.level = level
            print("Transferring level to LearnWord: \(level)")
        }
        if segue.identifier == "toTestPage",
           let destinationVC = segue.destination as? TestPage,
           let level = sender as? String {
            destinationVC.level = level
            print("Transferring level to TestPage: \(level)")
        }
    }
    

}
