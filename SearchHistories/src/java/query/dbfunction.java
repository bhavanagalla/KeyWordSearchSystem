package query;

import java.sql.*;

public class dbfunction {

    private Connection con;
    private Statement stat;
    private ResultSet result;

    public void createConnection() throws Exception, SQLException {
        try {
            Class.forName(Resource.getdbDriver());
            con = DriverManager.getConnection(Resource.getDbUrl(), Resource.getDbUser(), Resource.getDbPass());
        } catch (SQLException ex) {
            throw ex;
        } catch (Exception ex) {
            throw ex;
        }
    }

    public void createConnection(String driver, String url) {
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url);
        } catch (Exception ex) {
        }
    }

    public void createConnection(String driver, String dataSource, String userName, String password) {
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(dataSource, userName, password);
        } catch (Exception ex) {
        }
    }

    public void closeConnection() {
        try {
            con.close();
        } catch (Exception ex) {
        }
    }

    public boolean updateRecord(String strSQL) throws SQLException {
       
            stat = con.createStatement();

            int status = stat.executeUpdate(strSQL);
            if (status == 1) {
                return true;
            } else {
                return false;
            }
        
    }

    public ResultSet queryRecord(String strSQL) throws SQLException {        
            stat = con.createStatement();
            result = stat.executeQuery(strSQL);
            return result;
        
    }    
}
