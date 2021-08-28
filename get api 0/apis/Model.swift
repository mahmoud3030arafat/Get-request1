import Foundation

struct Model:Decodable {
    let status : String?
    let totalResults:Int?
    let articles : [articles]
    private enum CodingKeys:String,CodingKey{
        
        case status = "status"
        case totalResults = "totalResults"
        case articles = "articles"
        
        
        
    }
}



struct articles:Decodable {
    let  source : source
    let  author : String?
    let  title : String?
    let  description : String?
    let  url : String?
    let  urlToImage: String?
    let  publishedAt : String?
    let  content : String?
    private enum CodingKeys:String,CodingKey{
        
        case source = "source"
        case author = "author"
        case title = "title"
        case description = "description"
        case url = "url"
        case urlToImage  = "urlToImage"
        case publishedAt = "publishedAt"
        case content = "content"
        
        
    }
    
}

struct source: Decodable {
    let name : String?
    let id : String?
    private enum CodingKeys:String,CodingKey{
        case name = "name"
        case id = "id"
    }
}
