/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.VO;

import java.sql.Timestamp;




public class Ronda_JugadorVO {
     private int juga_id  ;
     private int rond_id  ;
     private Timestamp fecha_juego ;
     private int id_ronda_jugador  ;

    public int getJuga_id() {
        return juga_id;
    }

    public void setJuga_id(int juga_id) {
        this.juga_id = juga_id;
    }

    public int getRond_id() {
        return rond_id;
    }

    public void setRond_id(int rond_id) {
        this.rond_id = rond_id;
    }

    public Timestamp getFecha_juego() {
        return fecha_juego;
    }

    public void setFecha_juego(Timestamp fecha_juego) {
        this.fecha_juego = fecha_juego;
    }

    public int getId_ronda_jugador() {
        return id_ronda_jugador;
    }

    public void setId_ronda_jugador(int id_ronda_jugador) {
        this.id_ronda_jugador = id_ronda_jugador;
    }

    public Ronda_JugadorVO() {
    }
     
     
}
