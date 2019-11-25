//
//  BandasController.swift
//  wikibandas
//
//  Created by Ana Lucia Blanco on 11/11/19.
//  Copyright © 2019 Ana Lucia Blanco. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class BandasController: UIViewController {

    @IBOutlet weak var tbBandas: UITableView!
    
    var bandas: [Modelo_Banda] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tbBandas.dataSource = self
        tbBandas.delegate = self
        
        AF.request("https://wikibandas.azurewebsites.net/wp-json/acf/v3/bandas").responseJSON {
        response in
        
        switch (response.result) {
            case .success (let datos) :
                if let arregloBandas = datos as? NSArray {
                    for banda in arregloBandas {
                        if let diccionarioBanda = banda as? NSDictionary {
                            let nuevaBanda = Modelo_Banda(diccionario: diccionarioBanda)
                            self.bandas.append(nuevaBanda)
                        }
                    }
                    
                    self.tbBandas.reloadData()
                }
            case .failure (let datos) :
            print("Algo salio mal, checalo mams: \(datos)")
            }
        }
    }

        @IBAction func act_Back(_ sender: Any) {
            self.dismiss(animated: true) {
                
            }
        }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToBandaDetalles" {
            let destino = segue.destination as? BandaDetalleController
            destino?.bandaDetalles = bandas[tbBandas.indexPathForSelectedRow!.row]
        }
    }
}


extension BandasController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 116
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bandas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_banda") as? Cell_Banda
        
        cell?.lblNombre.text = bandas[indexPath.row].nombre
        cell?.lblIntegrantes.text = bandas[indexPath.row].integrantes
        
        AF.request("https://wikibandas.azurewebsites.net\(bandas[indexPath.row].urlLogo)").responseImage {
            response in
            
            switch(response.result) {
            case .success(let data) : cell?.imgLogo.image = data
                
            case .failure(let data) : print("que paso master?, revisa el error \(data)")
            }
        }
        
        return cell!
    }
}
