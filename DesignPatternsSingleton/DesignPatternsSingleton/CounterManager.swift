//
//  CounterManager.swift
//  DesignPatternsSingleton
//
//  Created by Daniela Valadares on 03/11/25.
//

import Foundation

final class CounterManager {
    static let shared = CounterManager() // o static garante que a instância criada seja de fato global
    private init() { // o inicializador privado impede que se crie novas instâncias
        count = UserDefaults.standard.integer(forKey: "globalCount")
    }
    
    private(set) var count: Int {
        didSet {
            UserDefaults.standard.set(count, forKey: "globalCount")
        }
    }
    
    func increment() {
        count += 1
    }
    
    func reset() {
        count = 0
    }
}

// no Swift o static let define o shared automaticamente como lazy (inicializada apenas quando é usada pela primeira vez)
// e thread-safe (mesmo que várias threads acessem shared ao mesmo tempo, a instância é criada uma única vez),
// solucionando algumas problemáticas do padrão Singleton, o tornando mais simples e seguro usando Swift
