import Foundation

class LearnWordViewModel {
    private var repository = WordRepository()
    private var words: [Word] = []
    private var currentIndex = 0
    
    func getWordsByLevel(level: String, completion: @escaping () -> Void) {
        repository.fetchWordsByLevel(level: level) { [weak self] fetchedWords in
            self?.words = fetchedWords
            completion()
        }
    }
    
    func getCurrentWord() -> Word? {
        return words.isEmpty ? nil : words[currentIndex]
    }
    
    func moveToNextWord() {
        currentIndex = (currentIndex + 1) % words.count
    }
}

