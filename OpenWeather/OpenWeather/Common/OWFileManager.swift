//
//  OWFileManager.swift
//  OpenWeather
//
//  Created by Calin Drule on 21/12/2017.
//  Copyright © 2017 Calin Drule. All rights reserved.
//

import Foundation

class OWFileManager {
    
    enum FileError: Error {
        case urlError(reason: String)
        case fileOperation(reason: String)
    }
    
    private let fileManager = FileManager.default
    
    fileprivate struct FileErrorDescriptions {
        static let homeNotFound = "Home directory could not be located."
        static let invalidFilepath = "Invalid filepath %@."
        static let fileNotFound = "File not found at path %@."
        static let fileNotCreated = "File could not be created %@."
        static let writingFailed = "File could not be written %@."
    }
    
    // MARK: - Public methods
    
    public class func write(text: String, to relativePath: String) -> FileError? {
        guard let completePathURL = completeURLPath(relativePath: relativePath) else {
            return FileError.fileOperation(reason: String(format: FileErrorDescriptions.invalidFilepath, relativePath))
        }
        
        let data = text.data(using: String.Encoding.utf8)
        FileManager.default.createFile(atPath: completePathURL.path, contents: data, attributes: nil)
        
        do {
            try text.write(to: completePathURL, atomically: true, encoding: String.Encoding.utf8)
        }
        catch {
            return FileError.fileOperation(reason: String(format: FileErrorDescriptions.writingFailed, relativePath))
        }
        
        return nil
    }
    
    public class func read(relativePath: String) -> String? {
        if let completeURL = completeURLPath(relativePath: relativePath),
            let fileData = FileManager.default.contents(atPath: completeURL.path)  {
            return String(data: fileData, encoding: String.Encoding.utf8)
        }
        
        return nil
    }
    
    // MARK: - Private methods
    
    fileprivate class func completeURLPath(relativePath: String) -> URL? {
        guard let homePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
            print(FileError.urlError(reason: FileErrorDescriptions.homeNotFound))
            return nil
        }
        
        let completePathURL = URL(fileURLWithPath: homePath).appendingPathComponent(relativePath, isDirectory: false)
        guard completePathURL.isFileURL else {
            print(FileError.urlError(reason: String(format: FileErrorDescriptions.fileNotFound, relativePath)))
            return nil
        }
        
        return completePathURL
    }
}
