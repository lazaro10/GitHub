//
//  String+Constants.swift
//  desafio-ios
//
//  Created by Lázaro Lima dos Santos on 30/11/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

extension String {
    
    struct ViewError {
        static let error = "Error ao carregar a view"
        static let pageNotFound = "Pull Request não encontrado."
    }
    
    struct NetworkError {
        static let mapping = "Ocorreu um erro inesperado."
        static let weakConnection = "Aparentemente sua conexão está fraca."
        static let offline = "No momento você está offline."
        static let other = "Um erro inesperado ocorreu durante a comunicação com o servidor."
    }
    
    struct NavigationTitle {
        static let repositories = "Github JavaPop"
    }
}

