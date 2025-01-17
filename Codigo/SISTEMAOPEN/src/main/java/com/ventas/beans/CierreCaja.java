package com.ventas.beans;

public class CierreCaja {

    private int idCierre;
    private String fechaCierre;
    private double montoInicial;
    private double montoFinal;
    private double diferencia;
    private String observaciones;

    public CierreCaja() {
        super();
    }

    public CierreCaja(int idCierre, String fechaCierre, double montoInicial, double montoFinal, double diferencia, String observaciones) {
        super();
        this.idCierre = idCierre;
        this.fechaCierre = fechaCierre;
        this.montoInicial = montoInicial;
        this.montoFinal = montoFinal;
        this.diferencia = diferencia;
        this.observaciones = observaciones;
    }

    public int getIdCierre() {
        return idCierre;
    }

    public void setIdCierre(int idCierre) {
        this.idCierre = idCierre;
    }

    public String getFechaCierre() {
        return fechaCierre;
    }

    public void setFechaCierre(String fechaCierre) {
        this.fechaCierre = fechaCierre;
    }

    public double getMontoInicial() {
        return montoInicial;
    }

    public void setMontoInicial(double montoInicial) {
        this.montoInicial = montoInicial;
    }

    public double getMontoFinal() {
        return montoFinal;
    }

    public void setMontoFinal(double montoFinal) {
        this.montoFinal = montoFinal;
    }

    public double getDiferencia() {
        return diferencia;
    }

    public void setDiferencia(double diferencia) {
        this.diferencia = diferencia;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }
}
