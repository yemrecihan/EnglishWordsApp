import Foundation
import FirebaseFirestore

class WordRepository {
  
    func saveWordsToFirestore(words: [Word]) {
        let db = Firestore.firestore()
        
        for word in words {
            print("Saving word to Firestore: \(word.text ?? "No Text")") // Her kelimeyi kaydetmeden önce logl
            db.collection("words").addDocument(data: [
                "text": word.text ?? "",
                "definition": word.definition ?? "",
                "level": word.level ?? "",
                "partOfSpeech": word.partOfSpeech ?? ""
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document successfully added dor word: \(word.text ?? "No Text")")
                }
            }
        }
        print("All words have been processed for saving to Firestore")
    }
    
    func fetchWordsByLevel(level: String, completion: @escaping ([Word]) -> Void) {
        let db = Firestore.firestore()
        print("Fetching words for level: \(level)") // Debug
        db.collection("words").whereField("level", isEqualTo: level).getDocuments { (snapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
                completion([])
            } else {
                var words: [Word] = []
                if let documents = snapshot?.documents {
                    for document in documents {
                        let data = document.data()
                        print("Document data: \(data)") // Debug
                        if let text = data["text"] as? String,
                           let definition = data["definition"] as? String,
                           let level = data["level"] as? String,
                           let partOfSpeech = data["partOfSpeech"] as? String {
                            let word = Word(text: text, definition: definition, level: level, partOfSpeech: partOfSpeech)
                            words.append(word)
                        } else {
                            print("Document missing required fields: \(document.data())")
                        }
                    }
                    print("Fetched words: \(words)") // Debug için eklendi
                } else {
                    print("No documents found for level \(level)")
                }
                completion(words)
            }
        }
    }
}

