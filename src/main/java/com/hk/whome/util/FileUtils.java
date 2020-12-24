package com.hk.whome.util;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hk.whome.domain.HomeImgInfoDomain;

@Component
public class FileUtils {
	
	@Autowired
	private SelectKeySeqUtil selectKeySeq;
	
	@Autowired
	private WhomeUtilDAO whomeUtileDAO;
	
	@Autowired
	private AwsS3Upload awsS3Upload;

	public static String getFilePath(HttpServletRequest req) {
		String os = System.getProperty("os.name");
		String path = "";
		
		if(os.equals("Linux")) {
			path = "/usr/share/upfile/";
		}else {
			path = req.getSession().getServletContext().getRealPath("/resources/imgFile/home_detail/");
		}
		return path;
	}
	
	/**
	 * 숙소 이미지 등록
	 * @param files
	 * @param path
	 * @param surfix
	 * @return
	 * @throws Exception
	 */
	public void uploadHomeImg(MultipartFile[] files, String path, String homeID) throws Exception{
		
		for(int i = 0; i < files.length; i ++) {
			
			MultipartFile img = files[i];

			String fileName = "";
			String originalFileName = img.getOriginalFilename();
			
			if(!EmptyUtils.isEmpty(originalFileName)) {
				
				String extension = originalFileName.substring(originalFileName.lastIndexOf("."), originalFileName.length());
				String imgKey = selectKeySeq.selectSeqKey("20");
				fileName = imgKey+"_"+homeID+"_"+(i+1)+extension;
		
//				File file = new File(path+fileName);
//				img.transferTo(file);
				
				String uplodedUrl = awsS3Upload.upload(img, fileName, AwsS3Upload.HOME_IMG_PATH);
				
				HomeImgInfoDomain homeImgInfoDomain = new HomeImgInfoDomain();
				homeImgInfoDomain.setHomeImgKey(imgKey);
				homeImgInfoDomain.setHomeID(homeID);
//				homeImgInfoDomain.setHomeImgPath(path+fileName);
				homeImgInfoDomain.setHomeImgPath(uplodedUrl);
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
	
	/**
	 * 유저 이미지 업로드
	 * @param mreq
	 * @param userID
	 * @param req
	 * @return
	 * @throws Exception
	 */
	public String uploadUserImg(MultipartHttpServletRequest mreq , String userID , HttpServletRequest req) throws Exception {
		
		String imgName = "";
		String uplodedUrl = "";
		
		MultipartFile userImg = mreq.getFile("user_img");
		if(userImg !=null && !userImg.getOriginalFilename().equals("")) {

			String originName = userImg.getOriginalFilename();
//			String path = FileUtils.getFilePath(req);
			String extension = originName.substring(originName.lastIndexOf("."), originName.length());
			imgName = UUID.randomUUID().toString() + "_" + userID + extension;
			
//			File file = new File(path+imgName);
//			userImg.transferTo(file);
			
			uplodedUrl = awsS3Upload.upload(userImg, imgName, AwsS3Upload.USER_IMG_PATH);
		}
		return uplodedUrl;
	}
}
