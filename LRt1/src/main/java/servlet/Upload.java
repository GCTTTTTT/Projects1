package servlet;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import pojo.Data;
import util.JsonUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
 

/**
 * Servlet implementation class Upload
 */
@WebServlet("/upload")
public class Upload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Upload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * ��̨������һ���ж�
		 * 1.�ж��ļ���С
		 * 2.�ж��ļ���͸ߵı�ֵ
		 * 3.�ϴ�ʧ�ܽ�����ʾ
		 * 4.ͨ��map.put("msg","xxxxx")��ֵ������
		 * 
		 * 5.�����ļ���չ���ж�
		 * **/
		PrintWriter writer = null;
		System.out.println("�����Ƿ������upload������������");
		//1.�õ��ϴ��ļ��ı���Ŀ¼
		String savePath = this.getServletContext().getRealPath("/upload");
		//System.out.println(savePath2);
		//String savePath2 = "D:\\workplace\\MyBlog\\WebContent\\upload";
		String returnPath;
		//System.out.println("savePath��"+savePath);
		File file = new File(savePath);
		//2.�ж��ϴ��ļ��ı���Ŀ¼�Ƿ����
		// ���Ŀ¼�����ڻ���Ŀ¼���ļ�
		if(!file.exists()&&!file.isDirectory()) {
			System.out.println(savePath+"Ŀ¼�����ڣ���Ҫ����");
			//3.����Ŀ¼
			file.mkdir();
		}
		try {
			//4.ʹ��apache�ļ��ϴ���������ļ�����
			//4.1 ����һ��DiskFileItemFactory
			DiskFileItemFactory factory = new DiskFileItemFactory();
			//4.2 ����һ���ļ��ϴ�������
			ServletFileUpload upload = new ServletFileUpload(factory);
			//4.3����ϴ��ļ�������������
			upload.setHeaderEncoding("UTF-8");
			//4.4 �ж��ύ�����������Ƿ����ϴ���������
			if(!ServletFileUpload.isMultipartContent(request)) {
				return;
			}
			//5.ʹ��ServletFileUpload�������ϴ�����
				List<FileItem> list = upload.parseRequest(request);
				//6.���� �����ļ�
				for(FileItem item:list) {
					String filename = item.getName();
					//System.out.println(filename+"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
					if(filename==null||filename.trim().equals("")) {
						continue;
					}
					//ע�⣺��ͬ��������ύ���ļ����ǲ�һ���ģ���Щ������ύ�������ļ����Ǵ���·���ģ��磺  c:\a\b\1.txt������Щֻ�ǵ������ļ������磺1.txt
                    //�����ȡ�����ϴ��ļ����ļ�����·�����֣�ֻ�����ļ�������
                    filename = filename.substring(filename.lastIndexOf("\\") + 1);
                    //System.out.println(filename+"222222222222222222222222222222222222222");
                    //��ȡitem�е��ϴ��ļ���������
                    InputStream in = item.getInputStream();
                    //����һ���ļ������
                    returnPath = filename;
                    FileOutputStream out = new FileOutputStream(savePath+"\\"+filename);
                    //����һ��������
                    byte buffer[] = new byte[1024];
                    //�ж��������е������Ƿ��Ѿ�����ı�ʶ
                    int len = 0;
                    //ѭ�������������뵽���������У�(len=in.read(buffer))>0�ͱ�ʾin���滹������
                    while ((len = in.read(buffer)) > 0) {
                    	//System.out.println("�Ƿ�д����˷�����������");
                        out.write(buffer, 0, len);
				}
                    //�ر�������
                    in.close();
                    //�ر������
                    out.close();
                    //ɾ�������ļ��ϴ�ʱ���ɵ���ʱ�ļ�
                    item.delete();
                    Map<String, Object> map = new HashMap<String, Object>();
                	map.put("code", 0);
                	map.put("msg", "�Ҵ�upload��servlet�з�����");
                	Data data = new Data();
                	data.setReturnPath(returnPath);
                	map.put("data", data);
                	String jsonStr = JsonUtil.beanToString(map);
        			//System.out.println(jsonStr);
        			writer= response.getWriter();
        			writer.write(jsonStr);	
				}	
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			writer.flush();
			writer.close();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
