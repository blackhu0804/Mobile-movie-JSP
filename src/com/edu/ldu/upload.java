package com.edu.ldu;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.jspsmart.upload.SmartUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class upload
 */
@WebServlet("/upload")
public class upload extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    
    // 上传文件存储目录
    private static final String UPLOAD_DIRECTORY = "upload";
 
    // 上传配置
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB

	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		
		doPost(request,response);
	}

	@SuppressWarnings("deprecation")
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		
		String id = (String)request.getParameter("xx");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");  //设置编码  
        //获得磁盘文件条目工厂  
        DiskFileItemFactory factory = new DiskFileItemFactory();  
        //获取文件需要上传到的路径  
        String path = "D:\\myclipse\\.metadata\\.me_tcat85\\webapps\\Movie\\img"; //用来缓存图片的临时空间，在图片上传完毕后立即从此空间删除
        File file=new File(path);
        if(!file.exists()){
        	file.mkdirs();
        }
        factory.setRepository(new File(path));  
        //设置 缓存的大小，当上传文件的容量超过该缓存时，直接放到 暂时存储室  
        factory.setSizeThreshold(1024*1024) ;  
        //高水平的API文件上传处理  
        ServletFileUpload upload = new ServletFileUpload(factory);  
        try {  
            //可以上传多个文件  
            List<FileItem> list = (List<FileItem>)upload.parseRequest(request);  
            SmartUpload su = new SmartUpload();//新建一个SmartUpload对象
            for(FileItem item : list){  
                //获取表单的属性名字  
                String name = item.getFieldName();  
                //如果获取的 表单信息是普通的 文本 信息  
                if(item.isFormField()){                     
                    //获取用户具体输入的字符串 ，名字起得挺好，因为表单提交过来的是 字符串类型的  
                    String value = item.getString() ;  
                    request.setAttribute(name, value);  
                }else{  
                    //获取路径名  
                    String value = item.getName() ;  
                    //索引到最后一个反斜杠  
                    int start = value.lastIndexOf("\\"); 
                    
                    SimpleDateFormat format =  new SimpleDateFormat("yyyyMMddHHmmss"); 
                    Date date=new Date();
                    String ds=format.format(date);   //获取系统当前时间作为文件名的一部分
                    
                    //截取 上传文件的 字符串名字，加1是 去掉反斜杠，  
                    String filename = value.substring(start+1); 
                    String filepath=ds+filename;  //通过加时间字符串作为约束唯一文件名,加完时间的文件名
                    String temp=filename;    //临时存储
                    
                    String filename2=temp.substring(0,temp.lastIndexOf("."));  //获取不包含后缀名的文件名，用来对数据库操作作约束
                    
                    request.setAttribute(name, filename);  
                    //写到磁盘上  
                    File f=new File(path,filepath);
                    item.write( f );//第三方提供的  
                    String imgSrc = "./img/" + filepath;
                    System.out.println(imgSrc);
                    
                    Connection con = null;
				    Statement stmt=null;
					Class.forName("com.mysql.jdbc.Driver");
					String url="jdbc:mysql://localhost:3306/movie?useUnicode=true&characterEncoding=utf8&useSSL=true";
					con = DriverManager.getConnection(url,"root","root");
		         	stmt = con.createStatement();
		         	
					String sql="update movie_info set img = '" +imgSrc + "' where id = " +id;	
					System.out.println(sql);
		    		stmt.executeUpdate(sql);
		    		stmt.close();
		    		con.close();
            	 	response.sendRedirect("./admin/index.jsp");
                }  
            }  
              
        } catch (Exception e) {  
        	System.out.println("上传失败");
        	response.getWriter().print("error"+e);
        }  
		
	}

}

