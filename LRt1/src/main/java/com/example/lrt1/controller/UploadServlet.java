package com.example.lrt1.controller;

import jdk.nashorn.internal.parser.JSONParser;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.List;

public class UploadServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doPost(req, resp);
        System.out.println("文件上传过来了111");
        StringBuffer json = new StringBuffer();
        BufferedReader reader = req.getReader();
        String line = null;
        while((line = reader.readLine())!=null){
            json.append(line);


        }
//        String path = "http://localhost:8080/LRt1/downloadFile/test.txt";
//        String word = "试试";
//        BufferedWriter out = new BufferedWriter(
//                new OutputStreamWriter(new FileOutputStream(path,true)));
//        out.write(word);
////        out.write(json.toString()+"\r\n");
//        out.close();
        try {
            String word = "aaahahahahhahahahhah";
            FileOutputStream fileOutputStream = null;
            System.out.println(word);
            // 1 、获取要下载的文件名
//            String downloadFileName = "test.txt";
// 2 、读取要下载的文件内容 ( 通过 ServletContext 对象可以读取 )
//        ServletContext servletContext = getServletContext();
// 获取要下载的文件类型
//        String mimeType = servletContext.getMimeType("/downloadFile/" + downloadFileName);
//            File file = new File("src/controller/test1.txt");
            System.out.println(this.getServletContext().getRealPath("/"));
            File file = new File(this.getServletContext().getRealPath("/") + "downloadFile/test.txt");
//                        String filepath = "http://localhost:8080/LRt1/downloadFile/test.txt";
//            File file = new File("http://localhost:8080/LRt1/downloadFile/test.txt");
////        File file1 = new File("test1.txt");
//            System.out.println(word);
            if(!file.exists()){
                System.out.println("没有没有 ");
                file.createNewFile();
            }
            else {
                System.out.println("有有");
            }
            fileOutputStream = new FileOutputStream(file);
//            fileOutputStream = new FileOutputStream(filepath);
            fileOutputStream.write(json.toString().getBytes(StandardCharsets.UTF_8));
            fileOutputStream.flush();
            fileOutputStream.close();

            System.out.println(json);
            System.out.println(json.toString());

        }
        catch (Exception e){
            e.printStackTrace();
        }



    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doGet(req, resp);
        System.out.println("文件上传过来了yeah");
        StringBuffer json = new StringBuffer();
        BufferedReader reader = req.getReader();
        String line = null;
        while((line = reader.readLine())!=null){
            json.append(line);
        }
        String path = "http://localhost:8080/LRt1/downloadFile/test.txt";
        String word = "试试";
        BufferedWriter out = new BufferedWriter(
                new OutputStreamWriter(new FileOutputStream(path,true)));
        out.write(word);
//        out.write(json.toString()+"\r\n");
        out.close();


        System.out.println(json);
        System.out.println(json.toString());

    }
}
