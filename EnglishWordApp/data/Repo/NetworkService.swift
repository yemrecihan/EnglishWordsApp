import Foundation

class NetworkService {
    
    
    //Dosyamızdaki verileri işleyip sözlük olarak döndürüyoruz.------->>>>>>
    static func readCSV(filePath: String) -> [[String: String]]? {
        guard let data = try? String(contentsOfFile: filePath) else {
            return nil
        }
        
        var result: [[String: String]] = []
        let lines = data.components(separatedBy: .newlines).filter { !$0.isEmpty }
        let headers = lines[0].components(separatedBy: ",").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
        
        for line in lines.dropFirst() {
            var dict: [String: String] = [:]
            let values = line.components(separatedBy: ",").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            
            for (index, header) in headers.enumerated() {
                if index < values.count {
                    dict[header] = values[index]
                }
            }
            
            // Gereksiz veya boş alanları temizleyelim
            dict = dict.filter { !$0.key.isEmpty && !$0.value.isEmpty }
            
            result.append(dict)
        }
        
        return result
    }
    
}
