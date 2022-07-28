package com.soldsoldMarket.common.util;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.oreilly.servlet.multipart.FileRenamePolicy;

// File Rename ��å ����� ���ؼ� FileRenamePolicy �������̽��� �����Ѵ�.
public class FileRename implements FileRenamePolicy {
	
	// �ش� �޼ҵ带 ������ ���ε�Ǵ� ������ �̸��� ������ �� �ִ�.
	@Override
	public File rename(File oldFile) {		
		File newFile = null;
		int randomNum = 0;
		LocalDateTime dateTime = null;
		String oriName = null;
		String newName = null;
		String extension = null;	
		int dot = -1;
		
		do { 
			// ���� ������ �̸��� ���� (��¥_������.����Ȯ���� �������� ����)asdasd
			dateTime = LocalDateTime.now(); // ���� �ð�						
			randomNum = (int)(Math.random() * 1000);			 
			oriName = oldFile.getName(); // Ȯ���� ���� ���ϸ� ��������
			extension = "";			
			dot = oriName.lastIndexOf("."); // adfds.txt, asdfasf.hwp
			
			if(dot > -1) {
				extension = oriName.substring(dot); // Ȯ���ڸ� ��������
			}
			
			// �� ���� �̸� ����� (��¥_������.����Ȯ����)
			newName = dateTime.format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSSS")) + "_" + randomNum + extension;
			// getParent() : �θ� ��ο� ���� ��θ��� ���ڿ��� �Ѱ��ش�.
			newFile = new File(oldFile.getParent(), newName);			
		} while (!createNewFile(newFile));
		
		return newFile;
	}
	
	private boolean createNewFile(File file) {
		try {
			return file.createNewFile();
		}catch(IOException e) {
			return false;
		}
	}
}