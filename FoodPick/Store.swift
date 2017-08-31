//
//  Store.swift
//  FoodPick
//
//  Created by hbkim100 on 2017. 8. 23..
//  Copyright © 2017년 chdl0907. All rights reserved.
//

import Foundation
import UIKit

class Menu{             // 메뉴탭
    var item:String
    var itemDetail:String?
    var price:Int?
    var itemImage:UIImage?
    
    init(item:String,
         itemDetail:String?=nil,
         price:Int?,
         itemImage:UIImage?=nil){
        
        self.item=item
        self.itemDetail=itemDetail
        self.price=price
        self.itemImage=itemImage
    }
}

class Information{      // 정보탭
    var openinghour:String?
    var phonenumberInfo:String?
    var locationInfo:String?
    var estabidInfo:String?     // 상호명,사업자등록번호
    
    init(openinghour:String?=nil,
         phonenumberInfo:String?=nil,
         estabidInfo:String?=nil,
         locationInfo:String?=nil){
        
        self.openinghour=openinghour
        self.phonenumberInfo=phonenumberInfo
        self.estabidInfo=estabidInfo
        self.locationInfo=locationInfo
    }
}

// 푸드트럭은 메뉴와 정보를 상속받는다.
class Store: NSObject, NSCoding{    // 푸드트럭
    var category:String
    var storeName:String?
    var coverImage:UIImage?
    var notice:String?
    var menu:Menu?
    var info:Information?
    //var location:String?
    
    init(category:String,
         storeName:String?=nil,
         coverImage:UIImage?=nil,
         notice:String?=nil,
         menu:Menu?=nil,
         info:Information?=nil
         //location:String?=nil
        ){
        
        self.category=category
        self.storeName=storeName
        self.coverImage=coverImage
        self.notice=notice
        self.menu=menu
        self.info=info
        //self.location=location
    }
    
    convenience init(category:String, storeName:String){
        self.init(category: category,
                  storeName: storeName,
                  coverImage: nil,
                  notice: nil,
                  menu: nil,
                  info: nil
                  //location: nil
        )
    }
    
    // 초기화가 실패할 수 있을때 사용
    // 파일 > 인스턴스
    required init?(coder aDecoder: NSCoder) {
        self.category=aDecoder.decodeObject(forKey: "category") as! String
        self.storeName=aDecoder.decodeObject(forKey: "storeName") as? String
        self.coverImage=aDecoder.decodeObject(forKey: "coverImage") as? UIImage
        self.notice=aDecoder.decodeObject(forKey: "notice") as? String
        //self.location=aDecoder.decodeObject(forKey: "location") as? String
    }
    
    // 인스턴스 > 파일
    func encode(with aCoder: NSCoder){
        aCoder.encode(self.category, forKey: "category")
        aCoder.encode(self.storeName, forKey: "storeName")
        aCoder.encode(self.coverImage, forKey: "coverImage")
        aCoder.encode(self.notice, forKey: "notice")
        //aCoder.encode(self.location, forKey: "location")
    }
}
