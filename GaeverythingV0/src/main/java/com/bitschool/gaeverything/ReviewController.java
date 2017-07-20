package com.bitschool.gaeverything;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@RequestMapping(value = "review")
@Controller
public class ReviewController {
	@RequestMapping(value = "/viewReviewList", method = RequestMethod.GET)
	public String viewReviewList(){
		String url = "review/review_list";
		return url;
	}
	
	@RequestMapping(value = "/viewReviewRegist", method = RequestMethod.GET)
	public String viewReviewRegist(){
		String url = "review/review_regist";
		return url;
	}
	
	
}
