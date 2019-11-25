//
//  AlbumesController.swift
//  wikibandas
//
//  Created by Ana Lucia Blanco on 11/11/19.
//  Copyright © 2019 Ana Lucia Blanco. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class AlbumesController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    @IBOutlet weak var tv_Albumes: UITableView!
    
    var bandaID: Int = 0
    var albumes : [Modelo_Album] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tv_Albumes.dataSource = self
        tv_Albumes.delegate = self
        
        AF.request("https://wikibandas.azurewebsites.net/wp-json/acf/v3/albumes").responseJSON {
            response in
            switch (response.result) {
            case .success (let datos) :
                if let arregloAlbumes = datos as? NSArray {
                    for album in arregloAlbumes {
                    if let diccionarioAlbum = album as? NSDictionary {
                            let nuevoAlbum =
                                Modelo_Album(diccionario: diccionarioAlbum)
                        
                            if self.bandaID == nuevoAlbum.bandaID {
                                self.albumes.append(nuevoAlbum)
                            }
                        
                            print("\(self.bandaID) se supone es igual que \(nuevoAlbum.bandaID)")
                        }
                }
                    self.tv_Albumes.reloadData()
                }
            case .failure(let datos):
                 print("Algo salio mal, checalo mams: \(datos)")
            }
        }
    }
    
    func filtroDeAlbum(IDbanda: Int) {
        for album in albumes {
            print("ID en album: \(album.bandaID)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAlbumDetalles" {
            let destino = segue.destination as? AlbumDetalleController
            destino?.albumDetalles = albumes[tv_Albumes.indexPathForSelectedRow!.row]
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 124
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CeldaAlbum") as? Cell_Album
        
        cell?.lblNombre.text = albumes[indexPath.row].nombre
        cell?.lblDuracion.text = albumes[indexPath.row].duracion
        cell?.lblAnio.text = albumes[indexPath.row].anio
        AF.request("https://wikibandas.azurewebsites.net\(albumes[indexPath.row].urlPortada)").responseImage {
            response in
            switch(response.result){
                case .success(let data) : cell?.imgPortada.image = data
                
            case .failure(let data) : print("que paso master?, revisa el error \(data)")
        
            }
        }
        return cell!
    }
    
    
    
    @IBAction func act_Back(_ sender: Any) {
        self.dismiss(animated: true) {
            
        }
    }
    

}
