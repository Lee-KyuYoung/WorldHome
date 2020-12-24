package com.hk.whome.util;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;

@Component
public class AwsS3Upload{
	
//	@Value("#{awsProperty['aws.key']}")
//	private String accessKey;
//	
//	@Value("#{awsProperty['aws.secretkey']}")
//	private String secretKey;
//	
//	@Value("#{awsProperty['aws.bucket']}")
//	private String bucketName;
	
//	@Value("${aws.key}")
	private String accessKey = "AKIAIOYKF3KZZ7ZJSU4A";

//	@Value("${aws.secretkey}")
	private String secretKey = "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";
	
//	@Value("${aws.bucket}")
	private String bucketName = "lky-project";
	
	private final String cloudFrontUrl = "http://dqyia9b9ucmgd.cloudfront.net/";
	
	public static final String HOME_IMG_PATH = "img-upload/home-img/";
	
	public static final String USER_IMG_PATH ="img-upload/user-img/";
	
	
	
	private AWSCredentials awsCredential;
	private AmazonS3 s3Client;
	
	public AwsS3Upload() {
		
		System.out.println("AWS ------------------------ accesskey : "+accessKey+"           secretKey : "+secretKey);
		
		awsCredential = new BasicAWSCredentials(accessKey,secretKey);
		s3Client = AmazonS3ClientBuilder
				.standard()
				.withCredentials(new AWSStaticCredentialsProvider(awsCredential))
				.withRegion(Regions.AP_NORTHEAST_2)
				.build();
	}
	
	public String upload(MultipartFile file, String fileName, String path) throws IOException {
		System.out.println("File Name ---------------- "+path+fileName);
		s3Client.putObject(new PutObjectRequest(bucketName, path+fileName, file.getInputStream(),null)
				.withCannedAcl(CannedAccessControlList.PublicRead));
		
//		return s3Client.getUrl(bucketName, path+fileName).toString();
		return cloudFrontUrl+path+fileName;
		
	}

		

	
	
}
