package com.ventas.beans;

public class Producto {

    private int idProducto;
    private String nombreProducto;
    private String descripcion; // Nueva propiedad
    private double precio;
    private int stock;
    private int categoriaId; // Nueva propiedad

    public Producto() {
        super();
    }

    public Producto(int idProducto, String nombreProducto, String descripcion, double precio, int stock, int categoriaId) {
        super();
        this.idProducto = idProducto;
        this.nombreProducto = nombreProducto;
        this.descripcion = descripcion;
        this.precio = precio;
        this.stock = stock;
        this.categoriaId = categoriaId;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public String getDescripcion() {
        return descripcion; // Getter para "descripcion"
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion; // Setter para "descripcion"
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getCategoriaId() {
        return categoriaId; // Getter para "categoriaId"
    }

    public void setCategoriaId(int categoriaId) {
        this.categoriaId = categoriaId; // Setter para "categoriaId"
    }
}
