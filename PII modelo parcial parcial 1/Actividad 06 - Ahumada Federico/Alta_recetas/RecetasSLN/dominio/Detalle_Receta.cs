using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RecetasSLN.dominio
{
    internal class Detalle_Receta
    {
        public Ingrediente Ingrediente { get; set; }
        public int Cantidad { get; set; }

        public Detalle_Receta(Ingrediente ingrediente, int cant)
        {
            Ingrediente = ingrediente;
            Cantidad = cant;
        }
        



    }
}
