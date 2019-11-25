//
//  Modelo_Banda.swift
//  wikibandas
//
//  Created by Ana Lucia Blanco on 11/11/19.
//  Copyright © 2019 Ana Lucia Blanco. All rights reserved.
//

import Foundation
import UIKit

class Modelo_Banda {
    var idBanda: Int
    
    var urlLogo: String
    var nombre: String
    var integrantes: String
    
    var pais: String
    var periodoActividad: String
    var genero: String
    var firmaDiscografica: String
    var ultimaGira: String
    var urlIntegrantes: String
    var curiosidades: String
    
    init(diccionario: NSDictionary) {
        self.idBanda = 0
        self.urlLogo = ""
        self.nombre = ""
        self.integrantes = ""
        
        self.pais = ""
        self.periodoActividad = ""
        self.genero = ""
        self.firmaDiscografica = ""
        self.ultimaGira = ""
        self.urlIntegrantes = ""
        self.curiosidades = ""
        
        idBanda = diccionario.value(forKey: "id") as! Int
        
        if let acf = diccionario.value(forKey: "acf") as? NSDictionary {
            
            if let nombre = acf.value(forKey: "nombre") as? String {
                self.nombre = nombre
            }
            
            if let urlLogo = acf.value(forKey: "logo") as? String {
                self.urlLogo = urlLogo
            }
            
            if let integrantes = acf.value(forKey: "integrantes") as? String {
                self.integrantes = integrantes
            }
            
            if let pais = acf.value(forKey: "pais_de_origen") as? String {
                self.pais = pais
            }
            
            if let periodoActividad = acf.value(forKey: "periodo_de_actividad") as? String {
                self.periodoActividad = periodoActividad
            }
            
            if let genero = acf.value(forKey: "genero") as? String {
                self.genero = genero
            }
            
            if let firmaDiscografica = acf.value(forKey: "firma_discografica") as? String {
                self.firmaDiscografica = firmaDiscografica
            }
            
            if let ultimaGira = acf.value(forKey: "ultima_gira") as? String {
                self.ultimaGira = ultimaGira
            }
            
            if let urlIntegrantes = acf.value(forKey: "foto_integrantes") as? String {
                self.urlIntegrantes = urlIntegrantes
            }
            
            if let curiosidades = acf.value(forKey: "curiosidades") as? String {
                self.curiosidades = curiosidades
            }
        }
    }
}
