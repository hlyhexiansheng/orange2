package com.orange.service;

import java.util.ArrayList;

import com.orange.dao.user.ClothDao;
import com.orange.virtualentity.VirtualCloth;

public class ClothService {
	
	public static final ClothService instance = new ClothService();
	
	private ClothDao dao;
	
	public ClothService(){
		dao = ClothDao.instance;
	}
	
	public ArrayList<VirtualCloth> getClothById(int i){
		return dao.getVirtualClothById(i);
	}
	
}
