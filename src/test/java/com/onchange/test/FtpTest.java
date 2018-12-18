package com.onchange.test;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.junit.Test;

public class FtpTest {

	
	private String host="14.29.231.137";
	
	private Integer port=8021;
	
	private String name="onchange";
	
	private String password="onchange123";
	
	//private FTPClient ftpClient;
	
	//初始化ftp
	public FTPClient initFtpClinet() {
		FTPClient	ftpClient= new FTPClient();
		ftpClient.setControlEncoding("utf-8");
		
		try {
			ftpClient.connect(host, port);//链接ftp
			ftpClient.login(name, password);//登录ftp
			int code = ftpClient.getReplyCode();
			System.out.println(code);
			if(!FTPReply.isPositiveCompletion(code)) {
				System.out.println("登录失败");
				return null;
			}else {
				System.out.println("登录成功");
return ftpClient;
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ftpClient;
	}
	//上传文件
	public boolean uploadFile(String pathName,String fileName,String originFileName) {
		boolean flag = false;
		InputStream inputStream = null;
		System.out.println("开始上传文件");
		
		FTPClient ftpClient= null;
		try {
			File file = new File(fileName);
//			if(!file.exists()) {
//				System.out.println("上传失败");
//				return false;
//			}
			inputStream = new FileInputStream(file);
			ftpClient=initFtpClinet();
			ftpClient.enterLocalPassiveMode();
			ftpClient.setControlEncoding("UTF-8");
			ftpClient.setFileType(ftpClient.BINARY_FILE_TYPE);
			//可选创建目录
			//ftpClient.makeDirectory(name);
			//ftpClient.changeWorkingDirectory(pathName);
			boolean tmpStore = ftpClient.storeFile(originFileName, inputStream);
			System.out.println(tmpStore);
			inputStream.close();
			ftpClient.logout();
			flag=true;
			System.out.println("上传成功");
			
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("上传失败");
			
		}finally {
			if(ftpClient.isConnected()) {
				try {
					ftpClient.disconnect();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(inputStream !=null) {
				try {
					inputStream.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		
		
		return flag;
	}
	
	@Test
	public void testFtp() {
		String classpath = this.getClass().getResource("/").getPath();
		System.out.println(classpath);
		uploadFile("/www/imgs","/Users/lee/Documents/gitCode/mybbs/target/mybbs/static/img/avatar/avatar-default-1.png","xxxxcccc.png");
		
	}
}
