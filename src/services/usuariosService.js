const exibirUs = require('../controllers/usuariosController')
const buscarUsuario = require('../controllers/usuariosController')
const criarUsuario =require('../controllers/usuariosController')
const alterarDados =require('../controllers/usuariosController')
const apagarDados = require('../controllers/usuariosController')
const db = require('../db')

module.exports = {


    exibUsuarios: () =>{
        return new Promise((aceito, rejeitado) => {

            db.query('SELECT * FROM usuarios' , (error, results) =>{
                if(error) {rejeitado(error); return; }
                aceito(results);
            });
        });
    },

   buscarUsuario: (cadastro) =>{
        return new Promise((aceito, rejeitado) => {

            db.query('SELECT * FROM usuarios WHERE id = ?',[cadastro], (error, results) =>{
               if(error) {rejeitado(error); return; }
               if(results.length > 0){
               aceito(results[0]);
            }else{
                aceito(false);
            }
            });

        });
    },

    criarUsuario: (nome, nickname, email, senha, instituicao, responsavel) =>{
        return new Promise((aceito, rejeitado) => {

            db.query('INSERT INTO usuarios (nome, nickname, email, senha, instituicao, responsavel) VALUES (?, ?, ?, ?, ?, ?) ',
            [nome, nickname, email, senha, instituicao, responsavel],
            (error, results) =>{
               if(error) {rejeitado(error); return; }
               aceito(results.insertId);
            
            }
        );

        });
    },

    alterarDados: (id, nome, nickname, email, senha, instituicao, responsavel) =>{
        return new Promise((aceito, rejeitado) => {

            db.query('UPDATE usuarios SET nome = ?, nickname = ?, email = ?, senha = ?, instituicao = ?, responsavel = ? WHERE id = ?',
            [nome, nickname, email, senha, instituicao, responsavel, id],
            (error, results) =>{
               if(error) {rejeitado(error); return; }
               aceito(results);
            
            }
        );

        });
    },

    apagarDados: (id) => {
        return new Promise ((aceito, rejeitado)=>{

            db.query('DELETE FROM usuarios WHERE id =?',
            [id],
            (error, results)=>{
                if(error) {rejeitado(error); return; }
                aceito(results); 
           });
        });
    }
};
