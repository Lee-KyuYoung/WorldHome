package com.hk.whome.util;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.hk.whome.domain.HomeImgInfoDomain;

@Component
public class FileUtils {
	
	@Autowired
	private SelectKeySeqUtil selectKeySeq;
	
	@Autowired
	private WhomeUtilDAO whomeUtileDAO;

	public static String getFilePath() {
		String os = System.getProperty("os.name");
		String path = "";
		
		if(os.equals("Linux")) {
			path = "/usr/share/upfile";
		}else {
			path = System.getProperty("catalina.home");
		}
		return path;
	}
	
	/**
	 * 파일 업로드
	 * @param files
	 * @param path
	 * @param surfix
	 * @return
	 * @throws Exception
	 */
	public void uploadFiles(MultipartFile[] files, String path, String homeID) throws Exception{

		for(int i = 0; i < files.length; i ++) {
			
			MultipartFile img = files[i];

			String fileName = "";
			String originalFileName = img.getOriginalFilename();
			
			if(!EmptyUtils.isEmpty(originalFileName)) {
				
				String extension = originalFileName.substring(originalFileName.lastIndexOf("."), originalFileName.length());
				String imgKey = selectKeySeq.selectSeqKey("20");
				fileName = imgKey+"_"+homeID+"_"+(i+1)+extension;
		
				File file = new File(path+fileName);
				img.transferTo(file);
				
				HomeImgInfoDomain homeImgInfoDomain = new HomeImgInfoDomain();
				homeImgInfoDomain.setHomeImgKey(imgKey);
				homeImgInfoDomain.setHomeID(homeID);
//				homeImgInfoDomain.setHomeImgPath(path+fileName);
				homeImgInfoDomain.setHomeImgPath(fileName);
				homeImgInfoDomain.setHomeImgOrder(i + 1);
				
				if(i == 0) {
					homeImgInfoDomain.setHomeMainImgYN("Y");
				}else {
					homeImgInfoDomain.setHomeMainImgYN("N");
				}
		
				whomeUtileDAO.insertImgInfo(homeImgInfoDomain);
			}
		}
	}
}
