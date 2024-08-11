import Foundation

class WordViewModel {
    private var repository = WordRepository()
    var words: [Word] = []
    
    func importCSVAndSaveToFirestore() {
        
        print("importCSVAndSaveToFirestore function called.")
        
        if let filePath = Bundle.main.path(forResource: "EnglishWords", ofType: "csv") {
            print("CSV file found at path: \(filePath)")
            
         if let wordData = NetworkService.readCSV(filePath: filePath) {
             print("CSV data read successfully.")
             
         for data in wordData {
             print("Processing word data: \(data)")
         if let text = data["headword"], let definition = data["başlık"], let level = data["CEFR"], let partOfSpeech = data["pos"] {
         let word = Word(text: text, definition: definition, level: level, partOfSpeech: partOfSpeech)
         words.append(word)
             print("Prepared word: \(word.text ?? "No Text")")
                    }
                }
         repository.saveWordsToFirestore(words: words)
            }
         } else {
         print("CSV dosyası bulunamadı.")
            }
    }

         func getWordsByLevel(level: String, completion: @escaping ([Word]) -> Void) {
         repository.fetchWordsByLevel(level: level) { words in
         print("ViewModel fetched words: \(words)") // Debug için eklendi
         completion(words)
            }
         }
    }

