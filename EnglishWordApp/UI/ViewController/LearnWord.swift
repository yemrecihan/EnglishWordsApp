
import UIKit

class LearnWord: UIViewController {
    
    @IBOutlet weak var englishLabel: UILabel!
    
    @IBOutlet weak var turkishLabel: UILabel!
    
    
    var level: String?
    var words:[Word] = []
    var currentIndex = 0
    private var viewModel = LearnWordViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let selectedLevel = level ?? "A1"
        print("LearnWord level: \(selectedLevel)")
        
       
            viewModel.getWordsByLevel(level: selectedLevel) { [weak self]  in
                self?.updateUI()
               
            }
    }
    func updateUI() {
            guard let currentWord = viewModel.getCurrentWord() else {
                print("No words available for the level")
                return
            }
            englishLabel.text = currentWord.text
            turkishLabel.text = currentWord.definition
            print("Showing word: \(currentWord)")
        }
    
    /*func showNextWord() {
        guard !words.isEmpty else {
            print("No words available for the level")
            return
        }
        currentIndex = (currentIndex+1) % words.count
        let currentWord = words[currentIndex]
        englishLabel.text = currentWord.text
        turkishLabel.text = currentWord.definition
        print("Showing word: \(currentWord)")
    }*/
    
    

    @IBAction func nextButton(_ sender: Any) {
        viewModel.moveToNextWord()
        updateUI()
    }
    
    }
    


