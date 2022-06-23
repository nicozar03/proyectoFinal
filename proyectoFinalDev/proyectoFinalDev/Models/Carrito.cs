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
                     
                    
                     precioFinal =  precioFinal + (item.precio * item.cantidad)  ;
            }
            

            return precioFinal;
         }

        
        public List<Producto> sumarCantidad(int idProducto)
        {
            foreach(Producto item in ListaProductos)
            {
                if(item.idProducto == idProducto)
                {
                    item.cantidad = item.cantidad + 1;
                }
            }

            return ListaProductos;
        }

         public List<Producto> restarCantidad(int idProducto)
        {
            foreach(Producto item in ListaProductos)
            {  
                if(item.idProducto == idProducto)
                {
                    item.cantidad = item.cantidad - 1;
                  if(item.cantidad==0){
                Producto productoBorrado = item;
                ListaProductos.Remove(productoBorrado);
                }
                }
            
                  
 
        
                
            }

            return ListaProductos;
        }


    }
}

