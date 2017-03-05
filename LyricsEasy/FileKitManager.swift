//
//  FileKitManager.swift
//  LyricsEasy
//
//  Created by David Hu on 2017/1/24.
//  Copyright © 2017年 David Hu. All rights reserved.
//

import Foundation
import FileKit

public struct LyricsFile {
    var basicPath:String
    var lyricsTitle:String
    var lyricsContent:String
    var lyricsContentForShow:String
    
}

class FileKitManager: NSObject {
    let rootPath = Path("~")
    
    func readFiles() -> String {
        let textFiles = rootPath.find(searchDepth: 5) { path in
            path.pathExtension == "txt"
        }
        
        return String(describing: textFiles)
    }
    
    func newLyricsFile(lyrice:LyricsFile) -> Bool {
        do {
            try Path("~" + lyrice.lyricsTitle + ".txt").createFile()
            
            return saveLyrice(lyrice: lyrice)
        } catch  {
            return false
        }
    }

    func updateLyricsFile(lyrice:LyricsFile) -> Bool {
        
        return saveLyrice(lyrice: lyrice)
    }
    
    func saveLyrice(lyrice: LyricsFile) -> Bool {
        do {
            try lyrice.lyricsContent |> TextFile(path: rootPath + lyrice.lyricsTitle + ".txt")
            print("save file success")
            return true
        } catch {
            print("I can't write to a file?!")
            return false
        }
        return false
    }
}
