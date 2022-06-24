using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using proyectoFinalDev.Models;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;

namespace proyectoFinalDev.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {


        List<Producto> ListaProductos = new List<Producto>();


        ListaProductos = BD.ListaProductosDestacados();
        ViewBag.Producto = ListaProductos;


       


        return View();
    }
    public IActionResult detalleProductos(int idProducto, string descripcion, string nombre)
    {
        Producto producto;
        producto = BD.ConsultaProducto(idProducto);
        ViewBag.Producto = producto;
        ViewBag.Producto.descripcion = descripcion;
        ViewBag.Producto.nombre = nombre;

        return View("detalleProducto");
    }
    public IActionResult productos()
    {
        return View();
    }
    public IActionResult insumosComputacion()
    {
        return View();
    }
    public IActionResult libreriaTecnica()
    {
        return View();
    }
    public IActionResult FAQ()
    {
        return View();
    }
    public IActionResult contacto()
    {
        return View();
    }

    public IActionResult Privacy()
    {
        return View();
    }
    public IActionResult carrito()
    {

            Carrito MiCarrito = new Carrito();
        ViewBag.Carrito = MiCarrito;



        string MiCarritoString = JsonConvert.SerializeObject(MiCarrito);
        HttpContext.Session.SetString("Carrito", MiCarritoString);
        ViewBag.visits = HttpContext.Session.GetString("Carrito");






        return View();
    }

    public IActionResult VerSesion()
    {

        ViewBag.visits = HttpContext.Session.GetString("Carrito");
        ViewBag.Carrito = new Carrito();
        return View("Carrito");
    }
    public IActionResult AgregarProducto(int idProducto, string nombre, string descripcion, string foto, string marca, float precio, int stock, bool destacado, int cantidad)
    {
        var visitString = HttpContext.Session.GetString("Carrito");
        Carrito MiCarrito = JsonConvert.DeserializeObject<Carrito>(visitString);

        MiCarrito.AgregarProducto(new Producto(idProducto, nombre, descripcion, foto, marca, precio, stock, destacado, cantidad = 1));
                        
        string MiCarritoString = JsonConvert.SerializeObject(MiCarrito);


        ViewBag.visits2 = MiCarritoString;

        HttpContext.Session.SetString("Carrito", MiCarritoString);

        ViewBag.Carrito = MiCarrito;

        return View("Carrito");
    }
    public IActionResult SumarCantidad(int idProducto)
    {
        var sumarCantidad = HttpContext.Session.GetString("Carrito");
        Carrito MiCarrito = JsonConvert.DeserializeObject<Carrito>(sumarCantidad);
        MiCarrito.sumarCantidad(idProducto);
        string MiCarritoString = JsonConvert.SerializeObject(MiCarrito);

        HttpContext.Session.SetString("Carrito", MiCarritoString);
        ViewBag.Carrito = MiCarrito;

        return View("Carrito");
    }
     public IActionResult RestarCantidad(int idProducto)
    {
        var borrarCantidad = HttpContext.Session.GetString("Carrito");
        Carrito MiCarrito = JsonConvert.DeserializeObject<Carrito>(borrarCantidad);
        MiCarrito.restarCantidad(idProducto);
        string MiCarritoString = JsonConvert.SerializeObject(MiCarrito);

        HttpContext.Session.SetString("Carrito", MiCarritoString);
        ViewBag.Carrito = MiCarrito;

        return View("Carrito");
    }

      public IActionResult BorrarProducto(int idProducto)
    {
        var sumarCantidad = HttpContext.Session.GetString("Carrito");
        Carrito MiCarrito = JsonConvert.DeserializeObject<Carrito>(sumarCantidad);
        MiCarrito.borrarProducto(idProducto);
        string MiCarritoString = JsonConvert.SerializeObject(MiCarrito);

        HttpContext.Session.SetString("Carrito", MiCarritoString);
        ViewBag.Carrito = MiCarrito;

        return View("Carrito");
    }
    public IActionResult Pagar(Carrito MiCarrito)
    {

        return View("Pagar");
    }



    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
