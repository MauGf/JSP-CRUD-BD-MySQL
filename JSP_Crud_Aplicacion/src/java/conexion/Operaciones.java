/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Mau
 */
public class Operaciones {
    
 String driver;
    String url;
    String uss;
    String contra;

    public Operaciones() {

        driver = "com.mysql.jdbc.Driver";
        url = "jdbc:mysql://localhost:3306/universidad";
        uss = "root";
        contra = "practicaphp";
    }

    public int logear(String us, String pass) {
        Connection conn;
        PreparedStatement pst;
        ResultSet rs;
        int  nivel = 0;
        String sql = "select id from usuarios where nombre='" + us + "'and contra=md5('" + pass + "')";

        try {
            Class.forName(this.driver);
            conn = (Connection) DriverManager.getConnection(
                    this.url,
                    this.uss,
                    this.contra
            );
            pst = (PreparedStatement) conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                nivel = rs.getInt(1);
            }
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
        }
        return nivel;
    }
}
