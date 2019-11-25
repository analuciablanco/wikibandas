//
//  BandaDetalleController.swift
//  wikibandas
//
//  Created by Ana Lucia Blanco on 23/11/19.
//  Copyright © 2019 Ana Lucia Blanco. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class BandaDetalleController: UIViewController {

    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lblPais: UILabel!
    @IBOutlet weak var lblPeriodoActividad: UILabel!
    @IBOutlet weak var lblGenero: UILabel!
    @IBOutlet weak var lblFirmaDiscografica: UILabel!
    @IBOutlet weak var lblUltimaGira: UILabel!
    @IBOutlet weak var lblIntegrantes: UILabel!
    @IBOutlet weak var imgIntegrantes: UIImageView!
    @IBOutlet weak var lblCuriosidades: UILabel!
    
    var bandaID: Int = 0
    var bandaDetalles: Modelo_Banda?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(self.bandaDetalles!.idBanda)
        self.bandaID = bandaDetalles!.idBanda
        
        lblTitulo.text = bandaDetalles?.nombre
        lblNombre.text = bandaDetalles?.nombre
        
    AF.request("https://wikibandas.azurewebsites.net\(bandaDetalles!.urlLogo)").responseImage { response in
            switch(response.result) {
            case .success(let data):
                self.imgLogo.image = data
            case .failure(_):
                print("que paso master? no carga el logo")
            }
        }
        
        lblPais.text = bandaDetalles?.pais
        lblPeriodoActividad.text = bandaDetalles?.periodoActividad
        lblGenero.text = bandaDetalles?.genero
        lblFirmaDiscografica.text = bandaDetalles?.firmaDiscografica
        lblUltimaGira.text = bandaDetalles?.ultimaGira
        lblIntegrantes.text = bandaDetalles?.integrantes
    AF.request("https://wikibandas.azurewebsites.net\(bandaDetalles!.urlIntegrantes)").responseImage { response in
            switch(response.result) {
            case .success(let data):
                self.imgIntegrantes.image = data
            case .failure(_):
                print("que paso master? no carga la foto de integrantes")
            }
        }
        
        lblCuriosidades.text = bandaDetalles?.curiosidades
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAlbumList" {
            let destino = segue.destination as? AlbumesController
            destino?.bandaID = bandaID
        }
    }
    
    
    
    @IBAction func actBack(_ sender: Any) {
        self.dismiss(animated: true) {
            
        }
    }
}
