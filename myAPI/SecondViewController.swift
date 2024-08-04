//
//  SecondViewController.swift
//  myAPI
//
//  Created by Admin on 7/20/24.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var newsData = [Article]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherData()
        
    }
    func weatherData(completion: @escaping ([article]) -> ()) {
        let urlString = "https://newsapi.org/v2/everything?q=apple&from=2024-07-20&to=2024-07-20&sortBy=popularity&apiKey=API_KEY"
        let url = URL(string: urlString)
        guard url != nil else{
            print("error")
            return
        }
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { data, response, error in
            if error == nil, data != nil {
                let decoder = JSONDecoder()
                do{
                    let parasingData = try decoder.decode(NewsApi.self, from: data!)
                    completion([parasingData:])
                    print(parasingData)
                } catch {
                    print("parasing error")
                }
                
            }
        }
        dataTask.resume()
    }
    
   }
struct NewsApi: Decodable {
    var status: String
    var totalResults: Int
    var articles:[Article]
}
struct Article: Decodable{
    var author: String?
    var title: String?
    var publisher: String?
}
