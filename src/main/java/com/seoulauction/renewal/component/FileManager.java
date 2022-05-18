package com.seoulauction.renewal.component;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.seoulauction.renewal.domain.CommonMap;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Component
public class FileManager  {
	//public static final String UPLOAD_TEMP_PATH = "/tmp/TEST/";
	//public static final String DATA_FILE_PATH = "/tmp/DATA/";
	public static final String THUMB_PATH = "thum/";

	protected final static Logger logger = LoggerFactory.getLogger(FileManager.class);
	    
    public static String fileTempPath;
    public static String fileRootPath;

    @Value("${file.temp.path}")
    public void setFileTempPath(String value) {
    	fileTempPath = value;
    }
    
    @Value("${file.root.path}")
    public void setFileRootPath(String value) {
    	fileRootPath = value;
    }
	
	public static CommonMap uploadFile(MultipartFile file) throws IOException{
		CommonMap commonMap = new CommonMap();
		log.info("fileTempPath : " + fileTempPath);
		
			String file_name = file.getOriginalFilename();
			String save_file_name = UUID.randomUUID().toString() + "." + StringUtils.getFilenameExtension(file_name);
			Path uploadPath = Paths.get(fileTempPath + "/" + save_file_name);
			try {
				File Folder = new File(fileTempPath);
				
				if(!Folder.exists()) {
					Folder.mkdirs();
				}
				
	            Files.copy(file.getInputStream(), uploadPath, StandardCopyOption.REPLACE_EXISTING);
	            
	    		commonMap.put("file_path", fileTempPath);
	    		commonMap.put("file_name", save_file_name);
	    		commonMap.put("file_name_org", file_name);
	    		commonMap.put("size", file.getSize());
	    		
	    		return commonMap;
	        } catch (IOException e) {
	           e.printStackTrace();	        }
		return commonMap;
	}
	
	
	
	//20201011.blueerr.채용공고관리/이미지경로바뀜문제수정
	//isMove SQL에서 isMove false 호출되는 경우는 srcPath를 리턴해주고 종료한다.
	public static String moveTempFileChk(String srcPath, String srcFile, String kind, boolean isMove){
		if(isMove){
			logger.debug("file move : {}/{}", srcPath, srcFile);
			return moveTempFile(srcPath, srcFile, kind);
		}
		else{
			logger.debug("skip file move : {}/{}", srcPath, srcFile);
			return srcPath;
		}
	}

	public static String moveTempFile(String srcPath, String srcFile, String kind){
		return moveTempFile(srcPath, srcFile, kind, "yyyyMM");
	}

	public static String moveTempFile(String srcPath, String srcFile, String kind, boolean makeThumnail){
		return moveTempFile(srcPath, srcFile, kind, makeThumnail, "yyyyMM");
	}

	public static String moveTempFile(String srcPath, String srcFile, String kind, String dateFormat){
		return moveTempFile(srcPath, srcFile, kind, false, dateFormat);
	}

	public static String moveTempFile(String srcPath, String srcFile, String kind, boolean makeThumnail, String dateFormat){
		String tgtPath = fileRootPath;
		//tgtPath += !tgtPath.endsWith("/") ? "/" : "";
		
		String destPath = "/" + kind;
		if(srcFile != null){
			if(dateFormat != null && !dateFormat.isEmpty()){
				SimpleDateFormat fm = new SimpleDateFormat(dateFormat);
				String df = fm.format(Calendar.getInstance().getTime());
				
				destPath = destPath + "/" + df;
			}
			
			tgtPath = tgtPath + destPath;
	
			String f = moveFile(srcPath, srcFile, tgtPath, srcFile, makeThumnail);
			
			return destPath;
		}else{
			return "";
		}
			
	}

	public static String moveTempFile4Sale(String srcPath, String srcFile, String saleKind, long saleNo, String subKind, boolean makeThumnail){
		if(subKind == null) subKind = "";
		
		String kind = String.format("front/%s%04d%s", saleKind, saleNo, subKind);
		
		return moveTempFile(srcPath, srcFile, kind, makeThumnail, null);
	}

	public static boolean removeFile(String srcPath, String srcFile){
		String rootPath = fileRootPath;
		File sf = new File(rootPath + srcPath + srcFile);
		File thumbf = new File(rootPath + srcPath + THUMB_PATH + srcFile);

		if(sf.isFile()) sf.delete();
		if(thumbf.isFile()) thumbf.delete();
		
		return true;
	}

	public static String moveFile(String srcPath, String srcFile, String tgtPath, String tgtFile){
		return moveFile(srcPath, srcFile, tgtPath, tgtFile, false);
	}
	
	public static String moveFile(String srcPath, String srcFile, String tgtPath, String tgtFile, boolean makeThumnail){
		srcPath += !srcPath.endsWith("/") ? "/" : "";
		tgtPath += !tgtPath.endsWith("/") ? "/" : "";
		
		File sf = new File(srcPath + srcFile);
		File tf = new File(tgtPath + tgtFile);
		
		String path = sf.getAbsolutePath();

		try {
			FileUtils.moveFile(sf, tf);
			path = tf.getAbsolutePath();
			System.out.println("Move File Src : " + sf.getAbsolutePath() + ", Tgt : " + path);
			if(makeThumnail) createThumbnail(tgtPath + tgtFile, tgtPath + THUMB_PATH + tgtFile, 600);	// YDH수정(2016.10.31)   300 => 600 변경		
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return path;
	}

	public static boolean createThumbnail(String srcFile, String tgtFile, int maxDim)throws IOException{
		  FileInputStream fis = new FileInputStream(srcFile.replaceAll("/", "\\" + File.separator));
		  BufferedImage im = ImageIO.read(fis);
		  Image inImage = new ImageIcon(srcFile).getImage();
		  
		  double scale = (double) maxDim / (double) inImage.getHeight(null);
		  if (inImage.getWidth(null) > inImage.getHeight(null)) {
			  scale = (double) maxDim / (double) inImage.getWidth(null);
		  }

		  int scaledW = (int) (scale * inImage.getWidth(null));
		  int scaledH = (int) (scale * inImage.getHeight(null));
		  BufferedImage thumb = new BufferedImage(scaledW, scaledH, BufferedImage.TYPE_INT_RGB);
		  Graphics2D g2 = thumb.createGraphics();
		  g2.drawImage(im, 0, 0, scaledW, scaledH, null);
		  File save = new File(tgtFile.replaceAll("/", "\\" + File.separator));
		  
		  File savePath = new File(save.getParent());

		  if(!savePath.exists() || !savePath.isDirectory()) savePath.mkdirs();
		  
		  return ImageIO.write(thumb, "jpg", save);
	}
}
