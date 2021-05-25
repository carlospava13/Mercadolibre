//
//  TestConstants.swift
//  MercadoLibreTests
//
//  Created by Carlos Pava on 24/05/21.
//

import Foundation
import MLData
struct TestConstants {
    static let categories: [APICategoryModel] = [
        APICategoryModel(
            id: "MCO1747",
            name: "Accesorios para Vehículos"),
        APICategoryModel(
            id: "MCO441917",
            name: "Agro")
    ]
    
    static let productResult: APIProductResultModel = APIProductResultModel(results: products)

    static let products: [APIProductModel] = [
        APIProductModel(id: "MCO613152008",
                        title: "iPhone 11 128 Gb (product)red",
                        price: 2879900,
                        availableQuantity: 1,
                        permalink: "https://www.mercadolibre.com.co/iphone-11-128-gb-productred/p/MCO15149572",
                        thumbnail: "http://http2.mlstatic.com/D_639318-MLA44514977809_012021-I.jpg",
                        condition: "new")
    ]
    
    static let producDetail = APIProductDetailModel(title: "iPhone 11 128 Gb (product)red",
                                                    price: 2879900, pictures: [])
    
    static let productDescriptions: [APIProductDetailDescriptionModel] = [
        APIProductDetailDescriptionModel(plainText: "somos big44sale una tienda online \n\nGRATIS CONTROL AL MANDO MAS CAMARA GRATIS! SI INCLUYE LA CAMARA CON (CABLE DE 8 METROS MAS BROCA) INCLUYE MANDO AL TIMON SI INCLUYE MARCO O BISEL QUE ES LO MISMO\nVENDEMOS LOS REPUESTOS PARA NUESTROS RADIO COMPRA SEGURO CON NOSOTROS AÑOS DE EXPERIENCIA EN CAR AUDIO \n100% DE NUESTROS COMPRADORES NOS RECOMIENDAN!\nsomos BIG44SALE\n RADIO MODELO 2020 100% TOUCH , CON TECNOLOGIA DE IPHONE EN PANTALLA ,SI INCLUYE CAMARA \n------------ ESTA PROMOCION VA SOLO HASTA AGOTAR INVENTARIO -------- \nPUEDES MANIPULAR FUNCIONES DE TU CELULAR DESDE EL RADIO\n--RECIBE MARCO TOTALMENTE GRATIS PARA QUE NO TE QUEDE ESPACIOS EN LA INSTALACION\n--RECIBE BASES METALICAS PARA FIJAR TU RADIO GRATIS,MARCO Y DOS CONTROLES CUADRADO Y DE MANDO AL TIMON TOTALMENTE GRATIS\n--ENTREGA INMEDIATA!!!!...\nACCESORAMOS GRATIS PARA TU VEHICULO SOMOS ESPECIALIZADOS EN CAR AUDIO\n*******GRAN PROMOCION******* ULTIMAS UNIDADES***** APROVECHA ESTA PRECIO POR TIEMPO LIMITADO ACCESORIOS QUE SE VEN EN LA FOTO +ENVIO GRATIS!!!\n \n--ESTE RADIO TRAE CONVERTIDOR TIPO ANDROID (HASTA ANDROID9) PRESTA ATENCION CONECTAS TU CELULAR Y TODO LO QUE VEAS EN TU CELULAR LO PUEDES VER EN EL RADIO YPOR MEDIO DEL CABLE USB ESCUCHAR APLICACION UBER NETFLIX FACEBOOK WHATSSAP . YOUTUBE ENTRE OTRAS PODRAS DISFRUTAR SIN NINGUN PROBLEMA SIEMPRE Y CUANDO ESTEN INSTALADAS EN TU TELEFONO \n\nPanel de elegante diseño\nDoble Din \nPantalla Táctil de 7 pulgadas\nBluetooth\nPantalla a color \nControl de volumen Y CONTROL DE CABRILLA ES DECIR 2 CONTROLES,MARCO BASE METALICA CAJA MANUAL Y PACHAS\nEntrada y salida audio\nReproduce videos, películas, música \nSoporta disco duro externo\nSoporta cámara de reversa\nmirrorlink hasta android 9\nsoportamirrorlinkiphone6,7y8\nSirve como manos libres \nFunción reloj \nfacil instalacion (Debe hacerlo una persona con conocimiento)\nvideo salida unidireccional, Control ecualizador manual y preestablecido\nLector de memoria micro sd, memoria usb\nControl remoto \nRadio fm stereo digital con búsqueda y reserva automática\n\nPor tu compra recibes:\n CAMARA DE REVERSA CON TODO SUS ACCESORIOS (CABLE DE 8 METROS MAS BROCA)\nRadio para carro LCD 7\" Negro Doble DIN MODELO 2020\nCable de alimentación para ser instalado \nControl Remoto TRADICIONAl Y DE MANDO AL TIMON OSEA 2 CONTROLES\nManual\nSe manejan dos ref te pueden llegar cualquiera de las dos 7880 o 7018b \n\nGarantía un mes por defectos de fabricación no cubre golpes rayones humedad mala instalacion por el cliente por ejemplo que conecte el cable rosado mal, que es mal a una masa del carro o algun cable del parlante o algun cable que no sea el que sale del rca de la camara de reversa de color rojo que sale directo del stop trasero y haga masa esto quemara el radio y hara que no prenda , tampoco se da garantia si se evidencia una mala instalacion como por ejemplo los cables positivos conectados a masa o los negativos colocados a un cable conectado a 12voltios , por otro lado si su instalacion usted ha conectado el radio y no ha usado ningun tipo de aislante como cinta negra o termoencogible esto hace que su garantia se pierda , tambien si es manipulado los sticker de seguridad y se evidencia que el radio ha sido destapado pierde la garantia o una mala manipulación del comprador,tampoco es necesario aterrizar la imagen que se refiere a conectar el cable rosado no a la camara esto quemara el radio no lo dejara prender , mala manipulacion y pierde garantia ni tampoco se cubre pixeles muertos ya que esto se debe a golpes o apretones que se ocasionan por una mala manipulacion y se convierten en puntos no visibles que terminan en lineas.\nno incluye cable usb no se brinda garantia por accesorios del radio ya que estos se pueden caer mojar golpear etc.\nimportante ya que este producto es un producto tecnologico cada comprador debe asesorarse o investigar sobre su uso para el gozo y disfrute del producto la tienda no se hace responsable si el comprador no lo sabe usar")
    ]
}
