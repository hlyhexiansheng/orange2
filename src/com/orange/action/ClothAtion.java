package com.orange.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.orange.dao.user.ClothDao;
import com.orange.service.ClothService;
import com.orange.virtualentity.VirtualCloth;

public class ClothAtion extends ActionSupport implements RequestAware{

	private static final long serialVersionUID = 1L;
	
	private Map<String, Object> request;

	@Override
	public String execute() throws Exception {
		List<VirtualCloth> list = ClothService.instance.getClothById(1);
		this.request.put("list", list);
		return SUCCESS;
	}
	
	public Map<String, Object> getRequest() {
		return request;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

}
