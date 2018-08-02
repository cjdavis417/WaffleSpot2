//
//  Message.swift
//  App
//
//  Created by Christopher Davis on 7/28/18.
//

import FluentSQLite
import Foundation
import Vapor

struct Message: Content, SQLiteUUIDModel, Migration {
    var id: UUID?
    var username: String
    var content: String
    var date: Date
}
