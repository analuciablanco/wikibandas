//
//  AlbumDetalleController.swift
//  wikibandas
//
//  Created by Ana Lucia Blanco on 24/11/19.
//  Copyright © 2019 Ana Lucia Blanco. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class AlbumDetalleController: UIViewController {

    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var imgPortada: UIImageView!
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblCalificacion: UILabel!
    @IBOutlet weak var lblAnio: UILabel!
    @IBOutlet weak var lblDuracion: UILabel!
    @IBOutlet weak var lblGenero: UILabel!
    @IBOutlet weak var lblDiscografia: UILabel!
    @IBOutlet weak var lblProductores: UILabel!
    @IBOutlet weak var lblListaCanciones: UILabel!
    @IBOutlet weak var imgEstudio: UIImageView!
    
    var albumDetalles: Modelo_Album?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblTitulo.text = albumDetalles?.nombre
        lblNombre.text = albumDetalles?.nombre
        
        AF.request("https://wikibandas.azurewebsites.net\(albumDetalles!.urlPortada)").responseImage { response in
            switch(response.result) {
            case .success(let data):
                self.imgPortada.image = data
            case .failure(_):
                print("que paso master? no carga la portada")
            }
        }
        
        lblCalificacion.text = albumDetalles?.calificacion
        lblAnio.text = albumDetalles?.anio
        lblDuracion.text = albumDetalles?.duracion
        lblGenero.text = albumDetalles?.genero
        lblDiscografia.text = albumDetalles?.discografia
        lblProductores.text = albumDetalles?.productores
        lblListaCanciones.text = albumDetalles?.canciones
        
        AF.request("https://wikibandas.azurewebsites.net\(albumDetalles!.urlGrabacion)").responseImage { response in
            switch(response.result) {
            case .success(let data):
                self.imgEstudio.image = data
            case .failure(_):
                print("que paso master? no carga la buena foto")
            }
        }
        
    }
    
    @IBAction func actBack(_ sender: Any) {
        self.dismiss(animated: true) {
            
        }
    }
    
}
