package com.hk.whome.util;

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
				
				String uplodedUrl = awsS3Upload.loadS3()
						                       .upload(img, fileName, awsS3Upload.homeImgPath);
				
				HomeImgInfoDomain homeImgInfoDomain = new HomeImgInfoDomain();
				homeImgInfoDomain.setHomeImgKey(imgKey);
				homeImgInfoDomain.setHomeID(homeID);
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
			String extension = originName.substring(originName.lastIndexOf("."), originName.length());
			
			imgName = UUID.randomUUID().toString() + "_" + userID + extension;

			uplodedUrl = awsS3Upload.loadS3()
					                .upload(userImg, imgName, awsS3Upload.userImgPath);
		}
		return uplodedUrl;
	}
}
