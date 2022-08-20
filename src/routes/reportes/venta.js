const express = require('express');
const router = express.Router();
const dbConnection = require('../../database');

router.get('/fecha/:idUsuario/:idSession', async(req, res) => {
    const { idUsuario, idSession } = req.params;
    const usuariosCorrectos = await dbConnection.query('select * from usuarios where idUsuario = ?', idUsuario);   
   
    for (let i = 0; i < usuariosCorrectos.length; i++) {
        usuariosCorrectos[i].idUsuario = idUsuario;
        usuariosCorrectos[i].idSession = idSession;
    }
    res.render('ventas/reportes/fecha', { usuariosCorrectos, idSession, idUsuario });
});
router.post('/fecha/ventas/:idUsuario/:idSession',async(req,res)=>{
    let {idUsuario , idSession}=req.params;
    let createdAt=req.body, ban=0;
    let consulta='select * from ventas';
   let ventas=await dbConnection.query(consulta);
   let ventasfechaProductos=[];
   let ventasfechaServicios=[];
   let cuentaServicios=0;
   let cuentaProductos=0;
  // let idSucursal=await dbConnection.query("select idSucursal from sessiones where id=? and idSession=?");
  // idSucursal=idSucursal[0].idSucursal;
   for(let h=0; h<ventas.length; h++){
    if(separaFecha(ventas[h].createdAt, createdAt.createdAt)){
       ban=1;
    }
    if(ban==1){
        
        if(ventas[h].idServicio.length>0){
            let servicio=await dbConnection.query("select  * from servicios where idServicio=? and idSucursal=? and claveServicio=?", [ventas[h].idServicio , ventas[h].idSucursal ,ventas[h].clave]);
                  
            ventasfechaServicios.push(ventas[h]);
            ventasfechaServicios[cuentaServicios].nombre=servicio[0].nombre;
            ventasfechaServicios[cuentaServicios].precio=servicio[0].precio;
            ventasfechaServicios[cuentaServicios].utilidad=servicio[0].porcentaje;
            cuentaServicios++;
           // console.log(ventas[h]);
        }else if(ventas[h].idProducto.length>0){
            producto=await dbConnection.query("select * from productos where idProducto =? and clave=?",[ventas[h].idProducto ,ventas[h].clave]);
            if(producto.length>0){

           
  //productoInventario=await dbConnection.query("select * from inventario where idProducto =? and clave=? and idSucursa=?",[ventas[h].idProducto ,ventas[h].clave] ,ventas[h].idSucursal);
            ventasfechaProductos.push(ventas[h]); 
           ventasfechaProductos[cuentaProductos].marca=producto[0].marca;
            ventasfechaProductos[cuentaProductos].nombre=producto[0].linea +" "+producto[0].serie;
            ventasfechaProductos[cuentaProductos].nombre=producto[0].iva +" "+producto[0].iva;
            productoInventario=await dbConnection.query("select * from inventario where idProducto =? and clave=? and idSucursal=?",[ventas[h].idProducto ,ventas[h].clave ,ventas[h].idSucursal]);
           
                ventasfechaProductos[cuentaProductos].costo=productoInventario[0].costo;
                ventasfechaProductos[cuentaProductos].utilidad=productoInventario[0].utilidad;
               
                ventasfechaProductos[cuentaProductos].precioVenta=productoInventario[0].precioVenta;
                ventasfechaProductos[cuentaProductos].existencia=productoInventario[0].existencia;
                ventasfechaProductos[cuentaProductos].gastos=productoInventario[0].gastos;
                let precioEstimado=productoInventario[0].gastos+productoInventario[0].costo;              
               if(producto[0].iva==1){
                precioEstimado=precioEstimado+(precioEstimado*.16);
               }
               ventasfechaProductos[cuentaProductos].iva=producto[0].iva;
                    precioEstimado=precioEstimado+(precioEstimado*(productoInventario[0].utilidad/100));
                ventasfechaProductos[cuentaProductos].precioEstimado=precioEstimado;
                cuentaProductos++;
            }else{
                console.log("REVISAR INVENTARIO");
            }
           
        }

       
        
    //res.render();

   }
   ban=0;
   } 
   const usuariosCorrectos = await dbConnection.query('select * from usuarios where idUsuario = ?', idUsuario);   
       
   for (let i = 0; i < usuariosCorrectos.length; i++) {
       usuariosCorrectos[i].idUsuario = idUsuario;
       usuariosCorrectos[i].idSession = idSession;
   }
   res.render('ventas/reportes/fecha', { usuariosCorrectos, idSession, idUsuario ,ventasfechaProductos , ventasfechaServicios});
});

module.exports = router;

function separaFecha(fecha,fecha2){
    let cade="";
    fecha=fecha.toLocaleDateString();
   
    fecha2= fecha2.replace('-' , '/');
    fecha2= fecha2.replace('-' , '/');
    fecha=fecha.split('/');
    fecha2=fecha2.split('/');
    for(let i=0 ; i<=2; i++){
        fecha[i]=parseInt(fecha[i])
        fecha2[i]=parseInt(fecha2[i])
        
    }
    if((fecha[0]==fecha2[2]) && (fecha[1]==fecha2[1]) && (fecha[2]==fecha2[0]) ){
        return true;
    }else{
        return false;
        
    }
}