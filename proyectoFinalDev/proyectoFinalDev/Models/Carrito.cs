using System.Collections.Generic;
using System;
namespace proyectoFinalDev.Models
{

    public class Carrito
    {
        public DateTime Fecha;
        public List<Producto> ListaProductos = new List<Producto>();

        public void AgregarProducto(Producto Prod)
        {
            ListaProductos.Add(Prod);
        }

        public List<Producto> ListarProductos()
        {
            return ListaProductos;
        }


    }
}