//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Dmitro Levkutnyk on 24.11.2024.
//

import SwiftUI

@main
struct MemorizeApp: App {
  @StateObject var game = EmojiMemoryGame()
  
    var body: some Scene {
        WindowGroup {
          EmojiMemoryGameView(viewModel: game)
        }
    }
}
