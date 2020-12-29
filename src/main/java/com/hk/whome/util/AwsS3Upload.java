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

	@Value("#{awsProperty['aws.key']}")
	public String accessKey;

	@Value("#{awsProperty['aws.secretkey']}")
	public String secretKey;
	
	@Value("#{awsProperty['aws.bucket']}")
	private String bucketName;
	
	@Value("#{awsProperty['aws.cloudfront-url']}")
	private String cloudFrontUrl;
	
	@Value("#{awsProperty['aws.home-img-path']}")
	public String homeImgPath;
	
	@Value("#{awsProperty['aws.user-img-path']}")
	public String userImgPath;
		
	private AWSCredentials awsCredential;
	private AmazonS3 s3Client;
	
	public AwsS3Upload loadS3() {

		awsCredential = new BasicAWSCredentials(accessKey,secretKey);
		s3Client = AmazonS3ClientBuilder
				.standard()
				.withCredentials(new AWSStaticCredentialsProvider(awsCredential))
				.withRegion(Regions.AP_NORTHEAST_2)
				.build();
		return this;
	}
	
	public String upload(MultipartFile file, String fileName, String path) throws IOException {
		
		s3Client.putObject(new PutObjectRequest(bucketName, path+fileName, file.getInputStream(),null)
				.withCannedAcl(CannedAccessControlList.PublicRead));

		return cloudFrontUrl+path+fileName;
	}

		

	
	
}
