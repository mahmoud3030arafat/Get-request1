
import UIKit
protocol NewsDelegate {
    func update(NewsModel:NewsModel)
}

class secondTableViewController: UITableViewController,NewsDelegate {
   
    
  var array = [articles]()
    var model = [Model]()
    override func viewDidLoad() {
        super.viewDidLoad()
        ApiService.shared.delegate=self
              
        tableView.delegate=self
        tableView.dataSource=self
        ApiService.shared.getNews()
        
            
            
       
    }
//
    func update(NewsModel: NewsModel) {
        self.array = NewsModel.articles
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
           
       }
   //
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
     
        cell.textLabel?.text = array[indexPath.row].title

        return cell
    }
    
 // didselect
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let vc =   UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "third") as? ThirdTableViewController
        vc?.arr=array
     self.navigationController?.pushViewController(vc!, animated: true)

        
    
    }
    // hight
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    



}
