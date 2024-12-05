package broths;

import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * ClsGestorTienda.java
 */
/**
 *
 * @author RGGH
 */
public class ClsGestorTienda {

    ClsConexion conexion;
// ---------------------------------------------------------------------------    


    public ClsGestorTienda() {
        conexion = new ClsConexion("Store");
    }
// ---------------------------------------------------------------------------        

  /*  public boolean conectaBD(String strUsuario, String strContrasenha) {
=======
    /*public boolean conectaBD(String strUsuario, String strContrasenha) {
>>>>>>> dev
        return conexion.conectate(strUsuario, strContrasenha);
    }*/
// ---------------------------------------------------------------------------        

    public boolean conectado() {
        return conexion.conectado();
    }
// --------------------------------------------------------------------------- 

    public void desconecta() {
        conexion.cierraCon();
    }
// --------------------------------------------------------------------------- 

    public java.sql.ResultSet obtenAlumnos() {
        return conexion.obtenRS("tblAlumnos");
    }
// ---------------------------------------------------------------------------

    public MiModelo obtenModeloUsuario(String clvAlumno) {
        java.sql.ResultSet rs = conexion.obtenRegSelect("Select * from User where id='" + clvAlumno + "'");
        MiModelo elModelo = new MiModelo(rs);
        return elModelo;
    }
// ---------------------------------------------------------------------------

    public MiModelo obtenModeloUsuarios() {
        java.sql.ResultSet rs = conexion.obtenRegSelect("Select * from User");
        MiModelo elModelo = new MiModelo(rs);
        return elModelo;
    }
// ---------------------------------------------------------------------------

// ---------------------------------------------------------------------------
    public java.sql.ResultSet obtenProfesores() {
        return conexion.obtenRS("tblProfesores");
    }
// ---------------------------------------------------------------------------    

    public java.sql.ResultSet obtenBailes() {
        return conexion.obtenRS("tblBailes");
    }
// ---------------------------------------------------------------------------    

    public java.sql.ResultSet obtenNiveles() {
        return conexion.obtenRS("tblNiveles");
    }
// ---------------------------------------------------------------------------    

    public java.sql.ResultSet obtenGrupos() {
        return conexion.obtenRS("tblGrupos");
    }
// ---------------------------------------------------------------------------    

    public java.sql.ResultSet obtenAlumnosPorGrupo(String numGpo) {
        return null;
    }
// ---------------------------------------------------------------------------
//                           Obtener un solo campo
// ---------------------------------------------------------------------------

    public java.sql.ResultSet obtenCampoParaLista(String strTV, String strCampo) {
        String strSelect = "Select " + strCampo + " From " + strTV;
        return conexion.obtenRegSelect(strSelect);
    }
// ---------------------------------------------------------------------------    
//                            Altas de registros 
// ---------------------------------------------------------------------------

    public boolean altaUsuario(String arr_nomCampos[], String arr_datos[]) {
        int i, n;

        // se obtiene la colección de campos de la tabla de los alumnos
        java.util.TreeMap<String, ClsCampoBD> colCampos = conexion.obtenMapaCampos(conexion.obtenRS("User"));

        n = arr_nomCampos.length;

        // se rellena el valor para cada campo
        for (i = 0; i < n; i++) {
            ((ClsCampoBD) colCampos.get(arr_nomCampos[i])).valor = arr_datos[i];
        }

        // se solicita al objeto conexión que inserte el registro y se espera el resultado
        return conexion.insertaReg("User", colCampos);
    }
// ---------------------------------------------------------------------------    

    public boolean modificaAlumno(MiModelo mm) {
        int col, colCve = -1;
        String strCve = null;

        int numCampos = mm.getColumnCount();
        String[] strNomDatos = new String[numCampos];
        String[] strDatos = new String[numCampos];

        for (col = 0; col < numCampos; col++) {
            strNomDatos[col] = mm.getColumnName(col);
            strDatos[col] = (String) mm.getValueAt(0, col);
            System.out.println(col + " -> " + strNomDatos[col] + ":" + strDatos[col]);
            if (strNomDatos[col].toLowerCase().startsWith("clv")) {
                colCve = col;
                strCve = strDatos[col];
            }
        }
        java.util.TreeMap<String, ClsCampoBD> colCampos
                = conexion.obtenMapaCampos(conexion.obtenRegSelect("Select * from tblAlumnos where clvAlumno ='" + strCve + "';"));

        for (col = 0; col < numCampos; col++) {
            colCampos.get(strNomDatos[col]).valor = strDatos[col];
        }
        colCampos.get(strNomDatos[colCve]).valWhere = strCve;

        return conexion.modificaReg("tblAlumnos", colCampos);

    }

// ---------------------------------------------------------------------------    
    public boolean altaProfesor() {
        return true;
    }
// ---------------------------------------------------------------------------    

    public boolean altaBaile() {
        return true;
    }
// ---------------------------------------------------------------------------    

    public boolean altaNivel() {
        return true;
    }
// ---------------------------------------------------------------------------    

    public boolean altaGrupo() {
        return true;
    }
// ---------------------------------------------------------------------------    

    public boolean altaAlumnoEnGrupo(String numGpo, String clvAlumno) {
        return true;
    }
// ---------------------------------------------------------------------------    
// ---------------------------------------------------------------------------    
// ---------------------------------------------------------------------------    
// ---------------------------------------------------------------------------    
    
    public int loginUsuario(String email, String pass) {
        return conexion.conectate(email, pass);
    }
    
    public ResultSet obtenDatosUsuario(int id) {
        return conexion.obtenRegSelect("select * from User where id=" + id);
    }
    
    public ResultSet obtenDireccionesUsuario(int id) {
        return conexion.obtenRegSelect("select * from ShippingAddress where userId=" + id);
    }
    
    public ResultSet obtenMetodosPagoUsuario(int id) throws SQLException {
        return conexion.obtenRegSelect("select type, description from Payment inner join PaymentMethod on Payment.idPayment=PaymentMethod.Id where idUser=" + id);
    }

    
     public java.sql.ResultSet obtenRecetas(String categoria) {
        return conexion.obtenRegSelect("Select * from Recipes where tipo='" + categoria + "'");
    }
     

   public int cuentaUsuarios() {
        java.sql.ResultSet rs = conexion.obtenRegSelect("Select COUNT(*) as total from User");
        MiModelo elModelo = new MiModelo(rs);
        try {
            rs.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return Integer.parseInt((String) elModelo.getValueAt(0, 0));
    }

    public ResultSet obtenCatalogo() {
        return conexion.obtenRS("Catalog");
    }
    
    public ResultSet obtenCatalogo(String filters) {
        String concat = "";
        for (String filter : filters.split(" ")) {
            concat += "UCase(description) like '*" + filter.toUpperCase() + "*' or UCase(product) like '*" + filter.toUpperCase() + "*' or ";
        }
        concat = concat.substring(0, concat.length() - 4);
        return conexion.obtenRegSelect("Select * from Catalog where " + concat);
    }
    
    public MiModelo obtenProducto(String id) {
        ResultSet rs = conexion.obtenRegSelect("Select * from Catalog where id=" + id);
        MiModelo elModelo = new MiModelo(rs);
        return elModelo;
    }
    
    public boolean conectaBD() {
        return conexion.conectate("demo", "demo") >= 0;
    }
    

}
