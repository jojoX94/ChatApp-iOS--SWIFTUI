//
//  ViewRouter.swift
//  ChatApp
//
//  Created by Madiapps on 07/11/2022.
//

import Foundation
import SwiftUI

enum Page {
     case home
     case messages
     case user
     case notifications
 }

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .home
}

