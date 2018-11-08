//
//  ViewController.swift
//  BaseProject
//
//  Created by jintelai on 2018/6/29.
//  Copyright © 2018年 jintelai. All rights reserved.
//

import UIKit
import Moya
import Alamofire
import RxSwift

class ViewController: UIViewController {
    
    var provider = MoyaProvider<Service>()
    var bg = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        view.backgroundColor = UIColor.createColor(colorStr: "#f1f1f1")
        
        let dic: [String: Any] = ["str":"s"]
        let json = JSON(data: dic)
        let str: String? = json["str"]
       
        
        let para = ["UserGroupId":"3"] as [String: Any]
       // let provider = MoyaProvider<Service>()
        
        Request.request(provider: provider, target: .banner(para), modelType: String.self, disposeBag: bg, complete: { result in
            print(result)
        }) { error in
            print("====================")
            print(error)
        }
        
        provider.rx.request(Service.banner(para)).map(ResultModel<String>.self).subscribe(onSuccess: { result in
            //complete(result)
        },onError: { er in
            //error(er)
        }).dispose()
//        _ = provider.rx.request(Service.banner(para)).map(ResultModel<String>.self).subscribe(onSuccess: { result in
//
//        },onError: { er in
//
//        }).dispose()
//        let provider = MoyaProvider<Service>()
//        Request.request(target: Service.banner(para), modelType: String.self, complete: { result in
//            print(result)
//        }) { error in
//            print(error)
//        }
        
//        _ = provider.rx.request(Service.banner(para)).map(ResultModel<String>.self).subscribe { result in
//            switch result {
//            case .success(let obj):
//                //complete(obj)
//                print(obj)
//            case .error(let err):
//                //error(err)
//                print("==========")
//                print(err)
//            }
//            }.dispose()
        
        //let provider = MoyaProvider<Service>()
      
       /* provider.rx.request(.login(["":""])).map(ResultModel<String>.self).subscribe { result in
            switch result {
            case .success(let obj):
                print(obj)
            case .error(let error):
                print(error)
            }
        }.dispose()*/
        
        
        provider.rx
            .request(Service.banner(para))
            .mapModel(ResultModel<String>.self).subscribe( onSuccess: { (model) in
                let m = model
            }, onError: { (_) in
                
            }).dispose()
    }
    // config congfig
    func configAlmofire() -> SessionManager {
        let headers = Alamofire.SessionManager.default.session.configuration.httpAdditionalHeaders ?? [:]

        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = headers
        let m = Alamofire.SessionManager(configuration: config)
        return m
    }
    // bakcground download
    func configBackgroundDownload() -> SessionManager {
        let headers = Alamofire.SessionManager.default.session.configuration.httpAdditionalHeaders ?? [:]
        
        let config = URLSessionConfiguration.background(withIdentifier: "com.app.io")
        config.httpAdditionalHeaders = headers
        let m = Alamofire.SessionManager(configuration: config)
        return m
    }
}

