package com.itbank.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.MemberDTO;
import com.itbank.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired private MemberService memberService;

	@GetMapping("/member/join")
	public ModelAndView join() {
		ModelAndView mav = new ModelAndView("/member/join");
		return mav;
	}
	
	@PostMapping("/member/join")
	public ModelAndView join(MemberDTO dto) {
		ModelAndView mav = new ModelAndView("/member/join");
		memberService.add(dto);
		return mav;
	}
	
}
