package com.drugs.excel;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Row;

public class ExcelDao {
	
public void uploadExcelFile(HttpServletRequest request){
	String filePath = null;
	File file = null;
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	// process only if its multipart content
    if (isMultipart) {
            // Create a factory for disk-based file items
            FileItemFactory factory = new DiskFileItemFactory();
            // Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);
            try {
            	Class.forName("com.mysql.jdbc.Driver"); 
    			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/drug","root","root");
    			
    		    String sql = "insert into drugs values (?,?,?,?,?,?,?,?,?,?,?)";
    		    PreparedStatement pst = con.prepareStatement(sql);
                // Parse the request
            	List items = null; 
            	items = upload.parseRequest(request);

            	Iterator<List> itr = items.iterator();
            	while(itr.hasNext()){
                  FileItem item = (FileItem)itr.next();
                  if ( !item.isFormField () )	
                  {
                     // Get the uploaded file parameters
                	  String fileName = item.getName();
                     // Write the file
                     if( fileName.lastIndexOf("\\") >= 0 ){
                        file = new File( filePath + 
                        fileName.substring( fileName.lastIndexOf("\\"))) ;
                     }else{
                        file = new File( filePath + 
                        fileName.substring(fileName.lastIndexOf("\\")+1)) ;
                     }
                     item.write( file ) ;
                     ByteArrayInputStream input = new ByteArrayInputStream(IOUtils.toByteArray(new FileInputStream(file)));
                     POIFSFileSystem fs = new POIFSFileSystem(input);
                     HSSFWorkbook w = new HSSFWorkbook(fs);
                     HSSFSheet sheet = w.getSheetAt(0);
                     Row row;
                     for(int i=1; i<=sheet.getLastRowNum(); i++){
                    	row = sheet.getRow(i);
                     	pst.setInt(1, (int)row.getCell(0).getNumericCellValue());
                     	pst.setString(2, row.getCell(1).getStringCellValue());
                     	pst.setString(3, row.getCell(2).getStringCellValue());
                     	pst.setString(4, row.getCell(3).getStringCellValue());
                     	pst.setString(5, row.getCell(4).getStringCellValue());
                     	pst.setString(6, row.getCell(5).getStringCellValue());
                     	pst.setString(7, row.getCell(6).getStringCellValue());
                     	pst.setString(8, row.getCell(7).getStringCellValue());
                     	pst.setString(9, row.getCell(8).getStringCellValue());
                     	pst.setString(10, row.getCell(9).getStringCellValue());
                     	pst.setString(11, row.getCell(10).getStringCellValue());
                     	pst.executeUpdate();
                     	}
                     w.close();
                  	}
                  }
 // InputStream inputStream= new ByteArrayInputStream(IOUtils.toByteArray(new FileInputStream(file)));
            System.out.print("Data Stored successfully "+"<br>");
            }catch(FileNotFoundException e) {
            System.out.println("exception occured is---- "+e);      
            e.printStackTrace();
            }catch(SQLException ex){
            System.out.println(ex);
            } catch (IOException e) {
            System.out.println("exception occured is------ "+e);      
            e.printStackTrace();
            }catch (Exception e2) {System.out.println("-()-error"+e2);
            }
    	}
	
	}
}
