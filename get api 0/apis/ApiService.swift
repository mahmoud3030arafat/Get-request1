
import Foundation

class ApiService {
    var dataTask = URLSessionTask()
    static let shared = ApiService()
    var delegate  : NewsDelegate?
    func getNews(){
        
        let urlNews = "https://newsapi.org/v2/everything?q=apple&from=2021-08-04&to=2021-08-04&sortBy=popularity&apiKey=28f1864b61b647a2812608243a38b439"
        
        let url = URL(string: urlNews)
        let session = URLSession.shared
        dataTask = session.dataTask(with: url!, completionHandler: { (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
            }
            guard let response = response as? HTTPURLResponse  else {return}
            print(response)
            guard let data = data else  {return}
            do{
                let decoder = JSONDecoder()
                let json  =    try decoder.decode(Model.self, from: data)
                let newsmodel = NewsModel(status: json.status!, totalResults: json.totalResults!, articles: json.articles)
                self.delegate?.update(NewsModel: newsmodel)
                
            }catch let error {
                print( error.localizedDescription)
            }
            
        })
        dataTask.resume()
        
        
        
        
        
    }
}
