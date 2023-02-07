package com.itbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.service.MemberService;

@RestController
public class AjaxController {
	
	@Autowired private MemberService memberService;
	
	@GetMapping("/dupCheck/{inputId}")
	@ResponseBody
	public String dupCheck(@PathVariable("inputId") String inputId) {
		int row = memberService.dupCheck(inputId);
		if(inputId == "200") {
			int row2 = 1;
			String msg2 = "아이디를 입력하세요";
			msg2 = row2 + ":" + msg2;
			return msg2;
		}
		String msg = row == 1 ? "이미 사용중인 ID 입니다" : "사용 가능한 ID 입니다";
		msg = row + ":" + msg;
		return msg;
	}
	
	@GetMapping("/nicknameDupResult/{inputNickName}")
	@ResponseBody
	public String nicknameDupResult(@PathVariable("inputNickName") String inputNickName) {
		int row = memberService.nickNameDupCheck(inputNickName);
		String msg = row == 1 ? "이미 사용중인 닉네임 입니다" : "멋진 닉네임이에요!!";
		msg = row + ":" + msg;
		return msg;
	}

}
