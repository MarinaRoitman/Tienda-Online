using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TP_9___ECommerce.Models;


namespace TP_9___ECommerce.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ECommerce.InicializarEcommerce();
            return View();
        }

        public ActionResult Carrito()
        {
            ViewBag.carrito = ECommerce.ListarCarrito();
            ViewBag.importeFinal = ECommerce.TotalizarCarrito();
            return View();
        }

        public ActionResult ListadoProductosRubros(int codigoRubro, string denominacion)
        {
            ViewBag.nombreCategoria = denominacion;
            ViewBag.ProductosMostrarRubro = BDD.ObtenerProductosPorRubro(codigoRubro); 
            return View();
        }

        public ActionResult EliminarCarrito()
        {
            ViewBag.carrito = ECommerce.VaciarCarrito(); //Llamo al metodo de la clase Ecommerce y vacio el carrito
            return View("Carrito"); //Devuelvo la vista Carrito
        }

        public ActionResult AgregarProducto(int codigo, string quienLlamo)
        {
            Producto productoNuevo = ECommerce.ObtenerProducto(codigo); //Creo un producto y de doy como valor el correspondiente (el que eligió el cliente)
            ECommerce.AgregarProductoCarrito(productoNuevo);//Lo agrego al carrito

            if (quienLlamo == "ListadoProductosRubros") //Pregunto de si estoy llamando desde algún rubro
            {
                ViewBag.ProductosMostrarRubro = BDD.ObtenerProductosPorRubro(productoNuevo.codigoRubro); //En cuyo caso guardo en el viewbag los productos correspondientes
            }
            return View(quienLlamo); //Devuelvo la View correspondiente
        }

        public ActionResult EliminarProducto(int codigo)
        {
            ViewBag.carrito = ECommerce.EliminarProductoCarrito(codigo);
            ViewBag.carrito = ECommerce.ListarCarrito();
            ViewBag.importeFinal = ECommerce.TotalizarCarrito();
            return View("Carrito");

        }
    }
}