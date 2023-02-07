package com.itbank.repository;


import org.springframework.stereotype.Repository;

import com.itbank.model.MemberDTO;


@Repository
public interface MemberDAO {

	void addMember(MemberDTO dto);

	int dupCheck(String inputId);

	int nicknameDupResult(String inputNickName);


}
