using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TP_9___ECommerce.Models
{
    public class Rubro
    {
        private int _codigo;
        private string _icono;
        private string _denominacion;

        public Rubro(int codigo, string icono, string denominacion)
        {
            _codigo = codigo;
            _icono = icono;
            _denominacion = denominacion;
        }

        public int codigo
        {
            get
            {
                return _codigo;
            }

            set
            {
                _codigo = value;
            }
        }

        public string icono
        {
            get
            {
                return _icono;
            }

            set
            {
                _icono= value;
            }
        }

        public string denominacion
        {
            get
            {
                return _denominacion;
            }

            set
            {
                _denominacion = value;
            }
        }
    }
}