//
//  ModalFile.swift
//  myAPI
//
//  Created by Admin on 7/21/24.
//

import Foundation
class Studentmodel : Codable{
Let abcd : abcdmodel?

}
class abcdmodel: Codable{
Let xyzzy: xyzmodel?

}
class xyzmodel: Codable{
Let Name: string?
Let Mobile : Int?
Let City: string?
enum CodingKeys: String{
Case Name = “First Name”(//server name)

}
