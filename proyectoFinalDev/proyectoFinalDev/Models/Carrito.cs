using System.Collections.Generic;
using System;
namespace proyectoFinalDev.Models
{

    public class Carrito
    {
        public List<Producto> ListaProductos = new List<Producto>();
        

        public void AgregarProducto(Producto Prod)
        {
            ListaProductos.Add(Prod);
        }

        public List<Producto> ListarProductos()
        {
            return ListaProductos;
        }

         public float PrecioTotal(List<Producto> ListaProductos){
            float precioFinal = 0;
            foreach(Producto item in ListaProductos)
            {
                    precioFinal = precioFinal + item.precio ;
            }

            return precioFinal;
         }


    }
}

