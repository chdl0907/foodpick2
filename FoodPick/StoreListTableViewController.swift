//
//  StoreListTableViewController.swift
//  FoodPick
//
//  Created by hbkim100 on 2017. 8. 23..
//  Copyright © 2017년 chdl0907. All rights reserved.
//

import UIKit
import Foundation

class StoreListTableViewController: UITableViewController {
    
    // cell에 출력할 array를 선언한다.
    var stores:[Store]=Array()
    var menus:[Menu]=Array()
    var infos:[Information]=Array()
    //var informations[Information]=Array()
    
    // 외부,내부이름을 다르게 선언(외부:withFileName/내부:fileName)
    /*func getFilePath(withFileName fileName:String)->String{
        let dirPath=NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docDir=dirPath[0] as NSString
        print(docDir)
        
        // 데이터를 저장할 디렉토리 생성
        let filePath=docDir.appendingPathComponent(fileName)
        return filePath
        
    }*/

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menu1=Menu(item: "후라이드",
                       itemDetail: "",
                       price: 16000,
                       itemImage: UIImage(named:"a1")!)
        
        let info1=Information(openinghour:"영업시간",
                               phonenumberInfo:"전화번호",
                               estabidInfo:"사업장정보",
                               locationInfo:"위치정보")
        
        let store1=Store(category: "한식",
                         storeName : "교촌치킨",
                         coverImage : UIImage(named:"a1")!,
                         notice : "안녕하세요",
                         menu : menu1,
                         info : info1
                         //location: "서울시 구로구 고척로82"
        )
        
        self.stores.append(store1)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // 몇개의 cell을 보여줄 것인가
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return stores.count
    }

    // 반환받은 cell을 뿌려줌
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        // storeTableViewCell에 할당
        if let storeCell=cell as? StoreTableViewCell{
            let store=self.stores[indexPath.row]
            
            
            
            // Configure the cell...
            //let book=self.books[indexPath.row]
            
            // 가격에 천원단위 표기하는 방법
            let numFormatter: NumberFormatter=NumberFormatter()
            numFormatter.numberStyle=NumberFormatter.Style.decimal
            
            
            storeCell.coverImagecellLabel.image=store.coverImage
            storeCell.sotreNamecellLabel.text=store.storeName
            storeCell.locationcellLabel.text=store.info?.locationInfo
            storeCell.noticecellLabel.text=store.notice
            
            
            return storeCell
        }
        return cell

    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

class StoreTableViewCell: UITableViewCell {
    
    @IBOutlet weak var sotreNamecellLabel: UILabel!
    @IBOutlet weak var noticecellLabel: UILabel!
    @IBOutlet weak var locationcellLabel: UILabel!
    @IBOutlet weak var coverImagecellLabel: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
