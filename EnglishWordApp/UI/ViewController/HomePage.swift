

import UIKit

class HomePage: UIViewController {
   
    private var wordViewModel = WordViewModel()
    @IBOutlet weak var textView: UITextView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        print("Starting to import CSV and save to Firestore...")
        wordViewModel.importCSVAndSaveToFirestore()
        print("Finished importing CSV and saving to Firestore.")*/
        
   
    }
    
   
    
    @IBAction func levelButtonTapped(_ sender: UIButton) {
        
        var level :String = ""
        var segueIdentifier :String = "toDetailPage"
        
        switch sender.tag {
            
        case 1:
            level = "A1"
        
        case 2:
            level = "A2"
       
        case 3:
            level = "B1"
        
        case 4:
            level = "B2"
       
        case 5:
            level = "C1"
           
        case 6:
            level = "C2"
           
        default:
            break
        }
        print("Selected level: \(level)") // Debugging için eklendi
        performSegue(withIdentifier: segueIdentifier, sender: level)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetailPage",
                 let destinationVC = segue.destination as? DetailPage,
                 let level = sender as? String {
                  destinationVC.level = level
                  print("Passing level to DetailPage: \(level)") // Debugging için eklendi
              }
        
        
        
    }
    
}
