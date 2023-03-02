//
//  Webservice.swift
//  newsApp
//
//  Created by Faruk CANSIZ on 5.02.2023.
//

import Foundation

class Webservice {
    
    
    //Bir fonksiyon içerisinde closure'ı parametre olarak vericeksek ve fonksiyonun işi bittikten sonra döndürülcek bir tamamlama bloğu yapıyorsak escaping kullanılır.
    func downloadNews(url: URL, completion: @escaping ([News?]) -> () ) {
        
        //internetten bir istek yapınca URLSession kullanılır
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let newsArray = try?  JSONDecoder().decode([News].self, from: data)
                
                if let newsArray = newsArray {
                    completion(newsArray)
                    
                }
                
            }
        }.resume()
        //Bu istek bittikten sonra ne yapılacağını yazdığımız bir completion(tamamlama) bloğu var
        
        
        
    }
    
    
}



