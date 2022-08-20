const express = require('express');
const router = express.Router();
const dbConnection = require('../../database');
//const pdf = require("pdfkit");
const fs=require("fs");
const { Stream } = require('stream');
const { Console } = require('console');
router.get('/:idUsuario/:idSession/', async(req, res) => {
    const { idUsuario, idSession } = req.params;
    const usuariosCorrectos =getUsuariosCorrectos(await dbConnection.query('select usuario , idUsuario from usuarios where idUsuario=? ', idUsuario) ,idUsuario ,idSession);
    let consulta='';
    const ventasProceso=await dbConnection.query('select * from procesoVentas where idSession =?' ,idSession);
    let total=0;
    let  idProceso="";
    //console.log(ventasProceso);
    for (let i=0; i<ventasProceso.length ; i++){
        ventasProceso[i].total=(ventasProceso[i].precio * ventasProceso[i].cantidad);
        idProceso=ventasProceso[i].idProceso;
        if(ventasProceso[i].tipoVenta==1){
            const idServicio=ventasProceso[i].idServicio;
            consulta='select * from servicios where idServicio = '+"'" +idServicio +"'";
            let servicio=await dbConnection.query(consulta );
            
            for(j=0; j<servicio.length; j++){
                ventasProceso[i].nombre=servicio[j].nombre;
                ventasProceso[i].claveServicio=servicio[j].claveServicio;
            }
        }else if(ventasProceso[i].tipoVenta==2){
            const idProducto=ventasProceso[i].idProducto;
            consulta='select * from productos where idProducto = '+"'" +idProducto +"'";
            let producto=await dbConnection.query(consulta);
            for(let j=0; j<producto.length; j++){
                ventasProceso[i].nombre=""+producto[j].marca+" "+producto[j].linea+" "+producto[j].serie;
                ventasProceso[i].claveServicio=producto[j].clave;

            } 
        }
       
   }
  // console.log("idProceso:",idProceso)
   total=0
   for(let m=0; m<ventasProceso.length; m++){
    total+=ventasProceso[m].total;
}
  res.render('ventas/index', { usuariosCorrectos,idProceso ,ventasProceso,total });
});
let tota=0;
router.get('/servicios/:idUsuario/:idSession/', async(req,res)=>{
    const {idUsuario,idSession}=req.params;
    const usuariosCorrectos =getUsuariosCorrectos(await dbConnection.query('select usuario , idUsuario from usuarios where idUsuario=? ', idUsuario) ,idUsuario ,idSession); 
    let sucursal=await dbConnection.query('select * from sessiones where idSession = ? ' ,idSession);
    let idSucursal='';
    for(let i =0 ; i< sucursal.length; i++ ){
        idSucursal=sucursal[i].idSucursal;
    }    
    let servicios=await dbConnection.query('select claveServicio,  idServicio, nombre ,idSucursal ,precio from servicios where idSucursal = ? ' , idSucursal);
    let consulta='';
    let ventasProceso=await dbConnection.query('select * from procesoVentas where idSession =?' ,idSession);
    //console.log("Procceso ventas sql",ventasProceso);
   let idProceso="";
  for (let i=0; i<ventasProceso.length ; i++){
        ventasProceso[i].total=(ventasProceso[i].precio * ventasProceso[i].cantidad);
        if(ventasProceso[i].tipoVenta==1){
            const idServicio=ventasProceso[i].idServicio;
            consulta='select * from servicios where idServicio = '+"'" +idServicio +"'";
            let servicio=await dbConnection.query(consulta );
            ventasProceso=getVentasProceso(servicio,ventasProceso,i );   
                   
        }else if(ventasProceso[i].tipoVenta==2){ 
            const idProducto=ventasProceso[i].idProducto;
            consulta='select * from productos where idProducto = '+"'" +idProducto +"'";
            let producto=await dbConnection.query(consulta);
            for(let j=0; j<producto.length; j++){
                ventasProceso[i].nombre=""+producto[j].marca+" "+producto[j].linea+" "+producto[j].serie;
                ventasProceso[i].claveServicio=producto[j].clave;
                //total+=(ventasProceso[i].cantidad *  producto[j].precio)
            }
        }
        idProceso=ventasProceso[i].idProceso;

    }
  

   let total=0;
    for(let m=0; m<ventasProceso.length; m++){
        total+=ventasProceso[m].total;
    }
  res.render('ventas/servicios',{idProceso,idSession, idUsuario,idSucursal, usuariosCorrectos , servicios ,ventasProceso,total});
});
router.post('/ventaServicio/:idUsuario/:idSession/:idSucursal',async(req,res)=>{
 
    const {idSession, idSucursal, idUsuario}=req.params;
    const {cantidad ,producto}=req.body;
    let datos=producto.split(',');
    let precio=parseInt(datos[1]);
    let idProceso1=idProceso(70);
    let nuevoProcsoVenta={
        idSucursal:idSucursal,
        idUsuario:idUsuario,
        idProducto:'',
        idSession:idSession,
        idServicio:producto,       
        cantidad:cantidad,
        precio:precio,
        tipoVenta:1,
        idProceso:idProceso1
    };
    await dbConnection.query('insert into procesoventas set ?',nuevoProcsoVenta);
    res.redirect('/ventas/servicios/' + idUsuario + '/' + idSession  );
    
});
router.post('/serviciosAumento/:idProceso/:idSession/:idUsuario', async(req,res)=>{
    const {idProceso,idUsuario,idSession}=req.params;
    let consulta="select * from procesoventas where idProceso = '" +idProceso +"'";
   
    let procesoVenta=await dbConnection.query(consulta);
    let cantidad=0;
    for( let i =0 ; i<procesoVenta.length; i++){
        procesoVenta[i].cantidad+=1;
        cantidad=procesoVenta[i].cantidad;
    }
    let sqlQuery="update procesoventas set cantidad="+cantidad+"  where idProceso = '"+idProceso+"'";
    await dbConnection.query(sqlQuery);
    res.redirect('/ventas/servicios/' + idUsuario + '/' + idSession);
});
router.post('/serviciosDecremento/:idProceso/:idSession/:idUsuario', async(req,res)=>{

    const {idProceso,idUsuario,idSession}=req.params;
    let consulta="select * from procesoventas where idProceso = '" +idProceso +"'";
   
    let procesoVenta=await dbConnection.query(consulta);
    let cantidad=0;
    for( let i =0 ; i<procesoVenta.length; i++){
        if(procesoVenta[i].cantidad>1){
            procesoVenta[i].cantidad--;
            cantidad = procesoVenta[i].cantidad;
            let sqlQuery="update procesoventas set cantidad="+cantidad+"  where idProceso = '"+idProceso+"'";
            await dbConnection.query(sqlQuery);
        }
        else{
            await dbConnection.query('delete from procesoventas where idProceso = ? ' ,idProceso);
        }
        cantidad=procesoVenta[i].cantidad;
    }
    res.redirect('/ventas/servicios/' + idUsuario + '/' + idSession);
});


router.post('/serviciosCancelar/:idProceso/:idSession/:idUsuario',async(req,res)=>{
    const{idProceso,idSession,idUsuario}=req.params;
    const sqlQuery="delete from procesoventas where idProceso= '"+idProceso +"' and idSession = '"+idSession+"' and idUsuario='"+idUsuario+"'";
    await dbConnection.query(sqlQuery);
    res.redirect('/ventas/servicios/' + idUsuario + '/' + idSession );
});
router.get('/cancelar/:idUsuario/:idSession' ,async(req,res)=>{
    const {idUsuario,idSession}=req.params;
    const sqlQuery="delete from procesoventas where  idSession = '"+idSession+"' and idUsuario='"+idUsuario+"'";
    await dbConnection.query(sqlQuery);
     res.redirect('/ventas/'+idUsuario+'/'+idSession);
}); 

router.post('/nuevaCantidad/:idUsuario/:idSession/:idProceso',async(req,res)=>{
    const{idUsuario,idSession,idProceso}=req.params;
    console.log(req.params);
    const {cantidad}=req.body;
    const sqlQuery="update procesoventas set cantidad = " +cantidad +"  where idProceso = '" +idProceso +"' and idSession = '" +idSession +"'";  
    await dbConnection.query(sqlQuery);
    res.redirect('/ventas/servicios/' + idUsuario + '/' + idSession );
}); 
    router.get('/productos/:idUsuario/:idSession' , async(req,res)=>{
    const {idUsuario,idSession}=req.params;
    
    const usuariosCorrectos =getUsuariosCorrectos(await dbConnection.query('select usuario , idUsuario from usuarios where idUsuario=? ', idUsuario) ,idUsuario ,idSession); 
    var consulta= "select *from sessiones where idSession= '"+idSession+"'";
    let idSucursal=await dbConnection.query(consulta);
    idSucursal=getIdSucursal(idSucursal);
    consulta="select * from procesoventas where idSession = '" +idSession+"'";
    let idProceso="";
    let ventasProceso=await dbConnection.query(consulta);
    for (let i=0; i<ventasProceso.length ; i++){
        ventasProceso[i].total=(ventasProceso[i].precio * ventasProceso[i].cantidad);
        if(ventasProceso[i].tipoVenta==1){
            const idServicio=ventasProceso[i].idServicio;
            consulta='select * from servicios where idServicio = '+"'" +idServicio +"'";
            let servicio=await dbConnection.query(consulta );
            ventasProceso=getVentasProceso(servicio,ventasProceso,i );            
        }else if(ventasProceso[i].tipoVenta==2){ 
            const idProducto=ventasProceso[i].idProducto;
            consulta='select * from productos where idProducto = '+"'" +idProducto +"'";
            let producto=await dbConnection.query(consulta);
            for(let j=0; j<producto.length; j++){
                ventasProceso[i].nombre=""+producto[j].marca+" "+producto[j].linea+" "+producto[j].serie;
                ventasProceso[i].claveServicio=producto[j].clave;
            }
        }
        idProceso=ventasProceso[i].idProceso;
    }
   

    let total=0;
    for(let m=0; m<ventasProceso.length; m++){
        total+=ventasProceso[m].total;
    }
    res.render('ventas/productos',{idSession, idUsuario ,idProceso,idSucursal, usuariosCorrectos,ventasProceso , total});
});

router.post('/busquda/productos/:idUsuario/:idSession/:idSucursal',async(req,res)=> {
            const {idUsuario,idSession,idSucursal}=req.params;
            const{claveProducto}=req.body;
          //  res.send("."+claveProducto+".");
            let consulta = 'SELECT * FROM inventario WHERE clave = "'+claveProducto+'" and tipo ="venta"';
            let inventario=await dbConnection.query(consulta );
            console.log("este es el inventario .."+inventario);
            consulta="SELECT * FROM productos WHERE marca like '%"+claveProducto+"%' or descripcion like '%"
            +claveProducto+"%' or linea like '%"+claveProducto+"%' or serie like '%"+claveProducto+"%'" ;
            let productos = await dbConnection.query(consulta);
            let ban=0;
            if(productos.length>0){
                ban=1;
                for (let i = 0; i < productos.length; i++) {
                    consulta="select * from inventario where idProducto= '"+productos[i].idProducto+"' and clave = '"+productos[i].clave+"'";
                    inventario=await dbConnection.query(consulta );
                    for (let j = 0; j < inventario.length; j++) {
                        productos[i].precioVenta=inventario[j].precioVenta;
                        productos[i].existencia=inventario[j].existencia;
                      
                    }
                }
               
            } 
            if(inventario.length>0){
                ban=2;
                for (let i = 0; i < inventario.length; i++) {
                    consulta="select *  from productos where clave = '"+inventario[i].clave+"' and idProducto = '"+inventario[i].idProducto+"'";
                    productos=await dbConnection.query(consulta);
                    for(let j=0 ; j<productos.length; j++){
                        inventario[i].marca= productos[j].marca;
                    }                    
                }
            }
            if(ban==1){
                inventario=productos;
            }
    consulta="select * from procesoventas where idSession = '" +idSession+"'";
    let ventasProceso=await dbConnection.query(consulta);
    let idProceso="";
    for (let i=0; i<ventasProceso.length ; i++){
        ventasProceso[i].total=(ventasProceso[i].precio * ventasProceso[i].cantidad);
        if(ventasProceso[i].tipoVenta==1){
            const idServicio=ventasProceso[i].idServicio;
            consulta='select * from servicios where idServicio = '+"'" +idServicio +"'";
            let servicio=await dbConnection.query(consulta );
            ventasProceso=getVentasProceso(servicio,ventasProceso,i );            
        }else if(ventasProceso[i].tipoVenta==2){ 
            const idProducto=ventasProceso[i].idProducto;
            consulta='select * from productos where idProducto = '+"'" +idProducto +"'";
            let producto=await dbConnection.query(consulta);
            for(let j=0; j<producto.length; j++){
                ventasProceso[i].nombre=""+producto[j].marca+" "+producto[j].linea+" "+producto[j].serie;
                ventasProceso[i].claveServicio=producto[j].clave;
            }
        }
        //idProceso=ventasProceso[i].ventasProceso;
    }
    //console.log(ventasProceso);
    const usuariosCorrectos =getUsuariosCorrectos(await dbConnection.query('select usuario , idUsuario from usuarios where idUsuario=? ', idUsuario) ,idUsuario ,idSession);
    inventario=agregaDatos(inventario,idSession,idUsuario,idSucursal);
    let total=0;
    for(let m=0; m<ventasProceso.length; m++){  
        total+=ventasProceso[m].total;
    }
    res.render('ventas/productos',{idSession, idUsuario ,idSucursal, usuariosCorrectos,ventasProceso ,inventario,total});
       
}); 







router.post('/nuevoProductoProceso/:idUsuario/:idSession/:idSucursal/:idProducto',async(req,res)=>{
        const{idUsuario,idSession,idSucursal,idProducto}=req.params;
        const {cantidad}=req.body;
        const consulta='select precioVenta from inventario where idSucursal= "'+idSucursal+'" and idProducto= "'+idProducto+'"';
        let productoActual=await dbConnection.query(consulta)
        let idProceso1=idProceso(70);
    
    let nuevoProcsoVenta={
        idSucursal:idSucursal,
        idUsuario:idUsuario,
        idProducto:idProducto,
        idSession:idSession,
        idServicio:'',       
        cantidad:cantidad,
        precio:productoActual[0].precioVenta,
        tipoVenta:2,
        idProceso:idProceso1
    };
      
await dbConnection.query("insert into procesoventas set ? ",nuevoProcsoVenta);
res.redirect('/ventas/servicios/' + idUsuario + '/' + idSession);
  
});

router.get('/productosindividual/' ,async(req,res)=>{
   // res.send('venta de producto individual');
});







router.get('/terminarVenta/:idSession/:idUsuario/:idSucursal/' ,async(req,res)=>{
    const{idSession,idUsuario,idSucursal} =req.params;
    
    let ventasProceso=await dbConnection.query("select * from procesoventas where idSession ='"+idSession+"' and idUsuario='"+idUsuario+"' and idSucursal='"+idSucursal+"'");
    let clave="";
    let idServicio="";
    let idProducto="";
      let idVenta=idProceso(70);
      let ventasFinal=[];
      let venta="";
    for(let j=0; j<ventasProceso.length; j++){
       
        let proceso=ventasProceso[j];
        let cantidad= ventasProceso[j].cantidad;
        let idProceso=ventasProceso[j].idProceso;  
        if(ventasProceso[j].tipoVenta==1){
            let servicios=await dbConnection.query("select * from servicios where idServicio='"+ventasProceso[j].idServicio+"'");
            clave=servicios[0].claveServicio;
            idServicio=servicios[0].idServicio;
            idProducto="";
        }else if(proceso.tipoVenta==2){
            let productos=await dbConnection.query("select * from inventario where idSucursal='"+ventasProceso[j].idSucursal+"' and idProducto='"+ventasProceso[j].idProducto+"'");
          clave=productos[0].clave;
            idServicio="";
       idProducto=productos[0].idProducto;
            if((productos[0].existencia - cantidad >=0)){
                let restantes=productos[0].existencia-cantidad;
                await dbConnection.query("update inventario set existencia = " +restantes +"  where idProducto = '" +idProducto +"' and clave='"+clave+"' and tipo = 'venta' and idSucursal='"+idSucursal+"'");
            }else{  
                let cantidad1=productos[0].existencia - cantidad;
                //res.send("se registro la venta pero hay productos no dados de alta !!!");
            }   
        }
         venta={
           cantidad,
            clave,
       idProceso,
        idProducto,
       idServicio,
       idSession,
       idSucursal,
        idUsuario,
        idVenta
        };
        
        await dbConnection.query('insert into ventas set  ?',venta);
        await dbConnection.query("delete from procesoventas where idSucursal='"+idSucursal+"'  and idSession='"+idSession+"' and idProceso='"+idProceso+"'");
    }
    res.redirect('/ventas/servicios/' + idUsuario + '/' + idSession);
});

router.get('/dia/:idUsuario/:idSession/' ,async(req,res)=>{
    let {idSession, idUsuario}=req.params;
    let sucursal=await dbConnection.query("select * from sessiones where idSession=? and idUsuario = ?" ,[idSession,idUsuario]);
    console.log(sucursal);
    let idSucursal="";
    if(sucursal.length>0){
        for (const key in sucursal) {
            idSucursal=sucursal[key].idSucursal;
           // console.log("."+idSucursal+".");
        }
       // console.log("la sucursal es " ,idSucursal);
       let ventas=await dbConnection.query("select  * from ventas where idSucursal = ? and idSession=?  and idUsuario=?" ,[idSucursal ,idSession, idUsuario]);
       
    }else{
        //+console.log("no se encontro la session  requerida");
    }
    
});




router.get('/usuario/:idUsuario/:idSession/' ,async(req,res)=>{
    let {idSession, idUsuario}=req.params;
    let sucursal=await dbConnection.query("select * from sessiones where idSession=? and idUsuario = ?" ,[idSession,idUsuario]);
    console.log(sucursal);
    let idSucursal="";
    if(sucursal.length>0){
        for (const key in sucursal) {
            idSucursal=sucursal[key].idSucursal;
           // console.log("."+idSucursal+".");
        }
       // console.log("la sucursal es " ,idSucursal);
       let ventas=await dbConnection.query("select  * from ventas where idSucursal = ?  and idUsuario=?" ,[idSucursal , idUsuario]);
       
       if(ventas.length>0){
           console.log("de usuario");
        console.log(ventas);
        console.log("...");
       }else{
           console.log("no hay ventas registradas de este usuario");
       }
    }else{
        //+console.log("no se encontro la session  requerida");
        res.send("No hay sessiones con este usuario ");
    }
    
});


function generaPdf(){
    const stream=res.writeHead(200,{
        'Content-Type':'application/pdf',
        'content-disposition':'attachment;filename=factura17.pdf'
    });
    doc.on('data',(data)=>{stream.write(data)});
    doc.on('end',()=>{stream.end()});
    doc.text('este texto deberia aparecer en un pdf con  pdfkit' , 30 ,100);
    doc.end();
    
}
function idProceso(longitud) {
    let minusculas = [
        'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', 'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l',
        'z', 'x', 'c', 'v', 'b', 'n', 'm',
        '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '~', '!', "$", "^", "<", ">", "Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "A", "S", "D", "F", "G", "H",
        "J", "K", "L", "Z", "X", "C", "V", "B", "N", "M"
    ];
    let secretId = '';
    for (i = 0; i < longitud; i++) {
        let posAle = Math.floor(Math.random() * ((minusculas.length) + 0));
        secretId += minusculas[posAle];
    }
    return secretId;
}

function getUsuariosCorrectos(usuariosCorrectos ,idUsuario ,idSession){  
    for (let i = 0; i < usuariosCorrectos.length; i++) {
        usuariosCorrectos[i].idUsuario = idUsuario;
        usuariosCorrectos[i].idSession = idSession;
    } 
    return usuariosCorrectos;
}

function getIdSucursal(sucursales){
    let idSucursal='';
    for(let i=0; i<sucursales.length; i++){
        idSucursal=sucursales[i].idSucursal;
    }
    return idSucursal;
}
function getVentasProceso(servicio,ventasProceso , i ,claveServicio){
    for(j=0; j<servicio.length; j++){
        ventasProceso[i].nombre=servicio[j].nombre;
       
        ventasProceso[i].claveServicio=servicio[j].claveServicio;
    }
    return ventasProceso;
}
async  function getTotal(ventasProceso,consulta){
  
  
   return ventasProceso;
}
function agregaDatos(arre ,idSession,idUsuario,idSucursal){
    for(let i=0; i<arre.length; i++){
        arre[i].idSession=idSession;
        arre[i].idUsuario=idUsuario;
        arre[i].idSucursal=idSucursal;
    }
    return arre;
}
module.exports = router;                                                                                            