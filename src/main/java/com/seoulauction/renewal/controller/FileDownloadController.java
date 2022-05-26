package com.seoulauction.renewal.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seoulauction.renewal.component.S3Downloader;
import com.seoulauction.renewal.component.S3Uploader;
import com.seoulauction.renewal.mapper.aws.S3Mapper;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class FileDownloadController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = LoggerFactory.getLogger(FileDownloadController.class);
	
	private final S3Downloader s3Downloader;
	
	@RequestMapping("/fileDownload")
	public void download(String fileKey, String downloadFileName, HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			s3Downloader.download(fileKey, downloadFileName, request, response);
		} catch(Exception e) {
			throw e;
		}
	}
}
