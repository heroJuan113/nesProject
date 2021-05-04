const express = require('express');
const router = express.Router();
const dbConnection = require('../../database');
router.get('/nueva/', (req, res) => {
    //  console.log(req.params);
    const { usuario } = req.params;
    const nuevaContrasena = nuevaContrasena1(14);


});


function nuevaContrasena1(longitud) {
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
    /// alert(secretId);
    res.send(secretId);

}

router.get('/recuperar/:idUsuario/:idSession', async(req, res) => {
    console.log(req.body);
    console.log();
});
module.exports = router;