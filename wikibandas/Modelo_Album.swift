//
//  Modelo_Album.swift
//  wikibandas
//
//  Created by Ana Lucia Blanco on 24/11/19.
//  Copyright © 2019 Ana Lucia Blanco. All rights reserved.
//

import Foundation
import UIKit

class Modelo_Album {
    var bandaID: Int
    var nombre: String
    var anio: String
    var genero: String
    var canciones: String
    var duracion: String
    var urlPortada: String
    var productores: String
    var calificacion: String
    var discografia: String
    var urlGrabacion: String
    
    init(diccionario: NSDictionary) {
        self.bandaID = 0
        self.nombre = ""
        self.anio = ""
        self.genero = ""
        self.canciones = ""
        self.duracion = ""
        self.urlPortada = ""
        self.productores = ""
        self.calificacion = ""
        self.discografia = ""
        self.urlGrabacion = ""
        
        //var nuevoArreglo: [Int]
        
        if let acf = diccionario.value(forKey: "acf") as? NSDictionary {
            
            if let arregloID = acf.value(forKey: "banda") as? NSArray {
                
                for IDs in arregloID {
                    let nuevoArreglo = IDs as! Int
                    
                    self.bandaID = nuevoArreglo
                }
                
            }
            
            if let nombre = acf.value(forKey: "nombre") as? String {
                self.nombre = nombre
            }
            
            if let anio = acf.value(forKey: "anio") as? String {
                self.anio = anio
            }
            
            if let genero = acf.value(forKey: "genero") as? String {
                self.genero = genero
            }
            
            if let canciones = acf.value(forKey: "lista_de_canciones") as? String {
                self.canciones = canciones
            }
            
            if let duracion = acf.value(forKey: "duracion_total") as? String {
                self.duracion = duracion
            }
            
            if let urlPortada = acf.value(forKey: "foto_del_album") as? String {
                self.urlPortada = urlPortada
            }
            
            if let productores = acf.value(forKey: "productores") as? String {
                self.productores = productores
            }
            
            if let calificacion = acf.value(forKey: "calificacion") as? String {
                self.calificacion = calificacion
            }
            
            if let discografia = acf.value(forKey: "discografia") as? String {
                self.discografia = discografia
            }
            
            if let urlGrabacion = acf.value(forKey: "foto_estudio") as? String {
                self.urlGrabacion = urlGrabacion
            }
        }
    }
}
