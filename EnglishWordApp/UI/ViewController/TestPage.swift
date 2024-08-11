
import UIKit

class TestPage: UIViewController {
    @IBOutlet weak var englishWordLabel: UILabel!
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var option3Button: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    var level : String?
   /* var words : [Word] = []
    var currentWord: Word?*/
    private var viewModel = TestPageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let level = level {
            viewModel.loadWords(for: level) {[weak self]  in
                self?.updateUI()
                
            }
        }
    }
    private func updateUI() {
            guard let currentWord = viewModel.getCurrentWord(),
                  let options = viewModel.generateOptions() else {
                print("No words available for the level")
                return
            }
            
            englishWordLabel.text = currentWord.text
            
            let optionButtons = [option1Button, option2Button, option3Button]
            for (index, button) in optionButtons.enumerated() {
                button?.setTitle(options[index], for: .normal)
                button?.backgroundColor = .systemBlue
            }
        }
    
    
    /*func showNextWord(){
        guard !words.isEmpty else {
            print("No words available for the level")
            return
        }
        currentWord = words.randomElement()
        guard let currentWord = currentWord else {return}
        
        englishWordLabel.text = currentWord.text
        
        var options = [currentWord.definition]
        while options.count < 3 {
                    let randomWord = words.randomElement()
                    if let randomDefinition = randomWord?.definition, randomDefinition != currentWord.definition {
                        options.append(randomDefinition)
                    }
                }
        options.shuffle()
        
        let optionButtons = [option1Button, option2Button, option3Button]
        
        for (index, button) in optionButtons.enumerated() {
                   button?.setTitle(options[index], for: .normal)
                   button?.backgroundColor = .systemBlue // Şıkların renklerini sıfırla
               }
       
    }*/
    
   
    @IBAction func optionSelected(_ sender: UIButton) {
        guard let selectedOption = sender.title(for: .normal),
                   let correctAnswer = viewModel.getCurrentWord()?.definition else {
                 return
             }
             
             if selectedOption == correctAnswer {
                 sender.backgroundColor = .systemGreen
                 print("Correct!")
             } else {
                 sender.backgroundColor = .systemRed
                 print("Wrong!")
                 
                 // Doğru olan şıkkı yeşil yap
                 let optionButtons = [option1Button, option2Button, option3Button]
                 for button in optionButtons {
                     if button?.title(for: .normal) == correctAnswer {
                         button?.backgroundColor = .systemGreen
                         break
                     }
                 }
             }
       /* guard let selectedOption = sender.title(for: .normal) else { return }

              if selectedOption == currentWord?.definition {
                  // Doğru şık
                  sender.backgroundColor = .systemGreen
                  print("Correct!")
              } else {
                  // Yanlış şık
                  sender.backgroundColor = .systemRed
                  print("Wrong!")
                  
                  // Doğru olan şıkkı yeşil yap
                  let optionButtons = [option1Button, option2Button, option3Button]
                  for button in optionButtons {
                      if button?.title(for: .normal) == currentWord?.definition {
                          button?.backgroundColor = .systemGreen
                          break
                      }
                  }
              }*/
          
    }
    
    @IBAction func neextButtonTapped(_ sender: UIButton) {
        viewModel.moveToNextWord()
        updateUI()
    }
    
}
    

