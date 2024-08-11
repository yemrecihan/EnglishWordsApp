import Foundation

class TestPageViewModel {
    private var repository = WordRepository()
    private var words: [Word] = []
    private var currentWord: Word?
    
    func loadWords(for level: String, completion: @escaping () -> Void) {
        repository.fetchWordsByLevel(level: level) { [weak self] fetchedWords in
            self?.words = fetchedWords
            self?.currentWord = self?.words.randomElement()
            completion()
        }
    }
    
    func getCurrentWord() -> Word? {
        return currentWord
    }
    
    func generateOptions() -> [String]? {
        guard let currentWord = currentWord else { return nil }
        
        var options = [currentWord.definition]
        while options.count < 3 {
            let randomWord = words.randomElement()
            if let randomDefinition = randomWord?.definition, randomDefinition != currentWord.definition {
                options.append(randomDefinition)
            }
        }
        return options.shuffled()
    }
    
    func moveToNextWord() {
        currentWord = words.randomElement()
    }
}

