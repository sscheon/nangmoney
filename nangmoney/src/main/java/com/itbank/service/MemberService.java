package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.MemberDTO;
import com.itbank.repository.MemberDAO;

@Service
public class MemberService {
	
	@Autowired private MemberDAO memberDao;

	public void add(MemberDTO dto) {
		memberDao.addMember(dto);
	}

	public int dupCheck(String inputId) {
		return memberDao.dupCheck(inputId);
	}

	public int nickNameDupCheck(String inputNickName) {
		return memberDao.nicknameDupResult(inputNickName);
	}
	
	


}
