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
	
	private FTPClient ftpClient;
	
	//初始化ftp
	public void initFtpClinet() {
		this.ftpClient= new FTPClient();
		ftpClient.setControlEncoding("utf-8");
		
		try {
			ftpClient.connect(host, port);//链接ftp
			ftpClient.login(name, password);//登录ftp
			int code = ftpClient.getReplyCode();
			
			if(!FTPReply.isPositiveCompletion(code)) {
				System.out.println("登录失败");
			}else {
				System.out.println("登录成功");
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	//上传文件
	public boolean uploadFile(String name,String fileName,String originFileName) {
		boolean flag = false;
		InputStream inputStream = null;
		System.out.println("开始上传文件");
		
		try {
			File file = new File(fileName);
			if(!file.exists()) {
				System.out.println("上传失败");
				return false;
			}
			inputStream = new FileInputStream(file);
			initFtpClinet();
			ftpClient.setFileType(ftpClient.BINARY_FILE_TYPE);
			//可选创建目录
			//ftpClient.makeDirectory(name);
			//ftpClient.changeWorkingDirectory(name);
			ftpClient.storeFile(fileName, inputStream);
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
		uploadFile(null,"1.png","/img/avatar/avatar-default-1.png");
	}
}
