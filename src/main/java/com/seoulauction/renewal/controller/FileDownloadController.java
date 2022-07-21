package com.seoulauction.renewal.controller;

import com.seoulauction.renewal.component.S3Downloader;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequiredArgsConstructor
public class FileDownloadController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = LoggerFactory.getLogger(FileDownloadController.class);
	
	private final S3Downloader s3Downloader;
	
	/* 첨부파일 다운로드 */
	@RequestMapping("/fileDownload")
	public void download(String fileKey, String downloadFileName, HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			s3Downloader.download(fileKey, downloadFileName, request, response);
		} catch(Exception e) {
			throw e;
		}
	}
}
