using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ConsultasAutomotriz
{
    public partial class frmConsultas : Form
    {
        private Helper helper = new Helper();
        
        public frmConsultas()
        {
            InitializeComponent();

        }

        private void frmConsultas_Load(object sender, EventArgs e)
        {
            cboIntegrante.SelectedValue = -1;
            cboIntegrante.DropDownStyle = ComboBoxStyle.DropDownList;
            rbC1.Checked = true;
        }

        private void btnConsultar_Click(object sender, EventArgs e)
        {
            
            if (cboIntegrante.Text == "Conrado-Vitelli" && rbC1.Checked == true)
            { 
                //dgvResultados.DataSource = helper.Consultar("SP_VITELLI_1");
                
            }
            if (cboIntegrante.Text == "Conrado-Vitelli" && rbC2.Checked == true)
            {
                //dgvResultados.DataSource = helper.Consultar("SP_VITELLI_2");
                
            }
            ///////////////////////////////////////////////////////////////////////////////////////////
            if (cboIntegrante.Text == "Diego-Nicolas-Guizzo" && rbC1.Checked == true)
            {
                string input = "El Area de Finanzas necesita llevar un control de las distintas formas de cobro\nde las ventas realizadas para evaluar posibles inversiones de efectivo a lo\nlargo del año,mes por mes, para ello require una vista que le permita obtener\nla información de los productos mas vendidos en efectivo y su conversion en\ndolares al TC $ 300 por dolar.";
                
                lstEnunciado.Items.Clear();
                var lines = input.Split('\n').ToArray();
                lstEnunciado.Items.AddRange(lines);

                dgvResultados.DataSource = helper.Consultar("SP_GUIZZO_1");
                
            }
            if (cboIntegrante.Text == "Diego-Nicolas-Guizzo" && rbC2.Checked == true)
            {
                string input = "El Area de RRHH y Comercializaciònd, a los efectos de evaluar el objetivo\nde ventas por volumen e importe y determniación de Bono para empleados\nanual en funcion de su histórico de pedidos, se necesita determinar una\nconsulta que verifique aquellos empleados cuyo promedio de pedidos sea \nmayor al promedio de pedidos general de este año, la cantidad total de \nunidades vendidas, y determinar el importe del bono como un % del promedio \nponderado de acuerdo a una escala 15% para importes superiores a $1000.000 \ny el resto 10%, y siempre que en los ultimos 6 meses haya vendido al menos \nuna unidad";
                
                lstEnunciado.Items.Clear();
                var lines = input.Split('\n').ToArray();
                lstEnunciado.Items.AddRange(lines);

                dgvResultados.DataSource = helper.Consultar("SP_GUIZZO_2");
                
            }
            ///////////////////////////////////////////////////////////////////////////////////////////
            if (cboIntegrante.Text == "Federico-Ahumada" && rbC1.Checked == true)
            {
                string input = "Se necesita saber que impacto tuvieron las ventas a concesionarias\nen articulos mayores o iguales a $10000 en la provincia de Córdoba en septiembre.\n-Detallar el promedio, la cantidad de ventas y el monto facturado por empleado.";
               
                lstEnunciado.Items.Clear();
                var lines = input.Split('\n').ToArray();
                lstEnunciado.Items.AddRange(lines);

                dgvResultados.DataSource = helper.Consultar("SP_AHUMADA_1");
                
            }
            if (cboIntegrante.Text == "Federico-Ahumada" && rbC2.Checked == true)
            {
                string input = "Buscando implementar el email marketing, se requiere saber el listado\nde clientes con e-mail registrado en la base de datos que hayan hecho\nórdenes de compra en los últimos 30 días.\nEl equipo se contactará con ellos a fin de ofrecer cupones de descuento\nen productos seleccionados.\nSe aplicarán descuentos del 7% a consumidor final y del 13% a vendedores\nde autopartes.";
                
                lstEnunciado.Items.Clear();
                var lines = input.Split('\n').ToArray();
                lstEnunciado.Items.AddRange(lines);

                dgvResultados.DataSource = helper.Consultar("SP_AHUMADA_2");
                
            }
            ///////////////////////////////////////////////////////////////////////////////////////////
            if (cboIntegrante.Text == "Matias-Nicolas-Villarruel" && rbC1.Checked == true)
            {
                
                //dgvResultados.DataSource = helper.Consultar("SP_VILLARRUEL_1");
                
            }
            if (cboIntegrante.Text == "Matias-Nicolas-Villarruel" && rbC2.Checked == true)
            {

                //dgvResultados.DataSource = helper.Consultar("SP_VILLARRUEL_2");
                
            }
        }

        




    }
}
