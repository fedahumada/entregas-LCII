using RecetasSLN.datos;
using RecetasSLN.dominio;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace RecetasSLN.presentación
{
    public partial class FrmAltaReceta : Form
    {
        Receta nuevaReceta = new Receta();
        Helper helper = new Helper();

        public FrmAltaReceta()
        {
            InitializeComponent();
        }

        private void FrmAltaReceta_Load(object sender, EventArgs e)
        {
            cboIngredientes.DataSource = helper.Consultar_SP("SP_CONSULTAR_INGREDIENTES");
            cboIngredientes.ValueMember = "id_ingrediente";
            cboIngredientes.DisplayMember = "n_ingrediente";
            cboIngredientes.DropDownStyle = ComboBoxStyle.DropDownList;

            cboIngredientes.SelectedIndex = -1;
            txtCantidad.Text = "1";
            txtCheff.Text = "Un cheff";
            txtNombre.Text = "Un cliente";
            txtTipoReceta.Text = "1";

            ProximaAlta();

        }


        public void ProximaAlta()
        {
            int next = helper.Proximo();
            if (next > 0)
                lblProx.Text = " RECETA # " + next.ToString();
            else
                MessageBox.Show("Error", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);

        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            

            if (txtCantidad.Text.Equals(String.Empty) || !int.TryParse(txtCantidad.Text,out _))
            {
                MessageBox.Show("Debe ingresar una cantidad", "ADVERTENCIA", MessageBoxButtons.OK,MessageBoxIcon.Warning);
                return;
            }
            
            if (cboIngredientes.Text.Equals(String.Empty))
            {
                MessageBox.Show("Debe ingresar al menos 3 ingredientes", "ADVERTENCIA", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
           
                //foreach (DataGridViewRow row in dgvDetalle.Rows)
                //{
                //    if (row.Cells["col_ingrediente"].Value.ToString().Equals(cboIngredientes.Text))
                //    {
                //        MessageBox.Show("El ingrediente ya fue agregado al listado", "INGREDIENTE YA AGREGADO", MessageBoxButtons.OK, MessageBoxIcon.Error);
                //        return;
                //    }
                    
                //}
            
            

            DataRowView item = (DataRowView)cboIngredientes.SelectedItem;
            int id = Convert.ToInt32(item.Row.ItemArray[0]);
            string nom = Convert.ToString(item.Row.ItemArray[1]);
            string uni = Convert.ToString(item.Row.ItemArray[2]);
            Ingrediente ingrediente = new Ingrediente(id, nom, uni);
            int cant = Convert.ToInt32(txtCantidad.Text);

            Detalle_Receta detalle = new Detalle_Receta(ingrediente,cant);
            nuevaReceta.AgregarDetalle(detalle);

            dgvDetalle.Rows.Add(new object[] { item.Row.ItemArray[0], item.Row.ItemArray[1], txtCantidad.Text, item.Row.ItemArray[2] });

            TotalIngredientes();

        }

        private void TotalIngredientes()
        {
            int contador = dgvDetalle.Rows.Count;
            lblTotal.Text = "Cantidad ingredientes agregados: " + contador;
        }

        private void btnGrabar_Click(object sender, EventArgs e)
        {

            if (txtCheff.Text.Equals(String.Empty))
            {
                MessageBox.Show("Debe ingresar un cheff", "ADVERTENCIA", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            if (txtNombre.Text.Equals(String.Empty))
            {
                MessageBox.Show("Debe ingresar un nombre", "ADVERTENCIA", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            if (txtTipoReceta.Text.Equals(String.Empty))
            {
                MessageBox.Show("Debe ingresar un tipo de receta", "ADVERTENCIA", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            if (dgvDetalle.RowCount < 3)
            {
                MessageBox.Show("Debe ingresar al menos 3 ingredientes, Ha olvidado ingredientes?", "ADVERTENCIA", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            GuardarReceta();
        }

        private void GuardarReceta()
        {
            nuevaReceta.Nombre = txtNombre.Text.ToString();
            nuevaReceta.TipoReceta = Convert.ToInt32(txtTipoReceta.Text);
            nuevaReceta.Cheff = txtCheff.Text.ToString();

            if (helper.Alta_Receta(nuevaReceta))
            {
                MessageBox.Show("RECETA CARGADA", "ADVERTENCIA", MessageBoxButtons.OK, MessageBoxIcon.Information);
                this.Dispose();
            }
            else
            {
                MessageBox.Show("ERROR AL CARGAR LA RECETA", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }
    }
}
