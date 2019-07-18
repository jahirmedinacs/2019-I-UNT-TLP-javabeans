import java.sql.*;

public class DB {
  
  private static final String ORG_MARIADB_JDBC_DRIVER = "org.mariadb.jdbc.Driver";
  
  private String userid;
  private String password;
  private String database;

  public DB(String userid, String password, String database) {
    this.userid = userid;
    this.password = password;
    this.database = database;

    this.Init(true);
  }

  private static void Init(Boolean verboseBoolean) {
    Driver this.jdbc = Class.forName(ORG_MARIADB_JDBC_DRIVER);
    if(verboseBoolean){
      System.out.println("Driver loaded");
    }    
  }

  private static void End(){
    connection.close();
  }

  public static void close(){
    connection.close();
  }

  public static void Start(String[] args, Boolean verboseBoolean) throws SQLException, ClassNotFoundException {
    // Try to connect
    Connection this.connection = DriverManager.getConnection
      ("jdbc:mysql://localhost/" + this.database, this.userid, this.password);

    if(verboseBoolean){
      System.out.println("It works!");
    }
    
  }

  public static void Query(){

  }
  
}
