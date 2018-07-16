
//
//  FileManager.swift
//  BaseProject
//
//  Created by jintelai on 2018/7/16.
//  Copyright © 2018年 jintelai. All rights reserved.
//
import Foundation
import Alamofire




struct File {
    func getUrl() {
        let documnetUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let gernralUrl = documnetUrl?.appendingPathComponent("download", isDirectory: true)
        
        let i = try? gernralUrl?.checkResourceIsReachable()
        if (i ?? false)! {
          try? FileManager.default.createDirectory(at: gernralUrl!, withIntermediateDirectories: true, attributes: nil)
        }
        
        
        /// 下载的dest
        let dest: DownloadRequest.DownloadFileDestination = { temporaryURL, response in
            
            let pathComponent = response.suggestedFilename
            let episodeUrl =
                gernralUrl?.appendingPathComponent(pathComponent!, isDirectory: false)
            
            
//            let rxit = try? episodeUrl?.checkResourceIsReachable() ?? false
//            if rxit! {
//                print("Clear the previous existing file.")
//
//                let fm = FileManager.default
//
//                try! fm.removeItem(at: episodeUrl!)
//            }
            return (destinationURL: episodeUrl!, options: DownloadRequest.DownloadOptions.removePreviousFile)
        }
        
        Alamofire.download("", method: .get, parameters: nil, headers: nil, to: dest).responseData { (result) in
            
        }
        
    }
    
    
    func createDest() {
        
    }
    
}
