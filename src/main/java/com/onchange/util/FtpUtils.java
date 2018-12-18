package com.onchange.util;

import java.io.IOException;
import java.io.InputStream;
import java.net.SocketException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;

public class FtpUtils {

	private Log log =  LogFactory.getLog(getClass());
	
	private volatile String ftpPath;
	
	private volatile Integer port;
	
	private volatile String ftpLoginName;
	
	private volatile String ftpPassword;
	
	
	
  public FtpUtils() {
		
	}



  private FTPClient initFtp() {
		FTPClient ftp = new FTPClient();
		try {
			ftp.connect(ftpPath, port);
			ftp.login(ftpLoginName, ftpPassword);
			int code = ftp.getReplyCode();
			if(!FTPReply.isPositiveCompletion(code)) {
				log.info("登录失败");
				return null;
			}else {
				log.info("登陆成功");
				return ftp;
			}
		} catch (SocketException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
	
  /**
   * 上传文件
   * @param inputStream 文件流
   * @param originFileName 上传到服务器的名字
   * @return
   */
	public Boolean uploadFile(InputStream inputStream,String originFileName) {
		boolean flag = false;
		log.info("开始上传文件...");
		FTPClient ftp = null;
		try {
            ftp=initFtp();
			ftp.enterLocalPassiveMode();
			ftp.setControlEncoding("UTF-8");
			ftp.setFileType(2);
			flag=ftp.storeFile(originFileName, inputStream);
			if(!flag) {
				log.info("上传返回---="+flag+"上传失败!");
				return false;
			}else {
				log.info("上传返回---="+flag+",上传成功!");
				return true;
			}
				
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.info("ftp上传失败"+e);
			return false;
		}finally {
			if(inputStream !=null) {
				try {
					inputStream.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(ftp.isConnected()) {
				try {
					ftp.disconnect();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}



public String getFtpPath() {
	return ftpPath;
}



public void setFtpPath(String ftpPath) {
	this.ftpPath = ftpPath;
}



public Integer getPort() {
	return port;
}



public void setPort(Integer port) {
	this.port = port;
}



public String getFtpLoginName() {
	return ftpLoginName;
}



public void setFtpLoginName(String ftpLoginName) {
	this.ftpLoginName = ftpLoginName;
}



public String getFtpPassword() {
	return ftpPassword;
}



public void setFtpPassword(String ftpPassword) {
	this.ftpPassword = ftpPassword;
}
	
}
