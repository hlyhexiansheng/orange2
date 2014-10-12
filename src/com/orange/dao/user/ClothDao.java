package com.orange.dao.user;

import java.util.ArrayList;

import com.orange.db.DBManager;
import com.orange.virtualentity.VirtualCloth;

public class ClothDao {
	
	public static final ClothDao instance = new ClothDao();
	
	private static final String SELECT_CLOTH_BY_ID = "select * from cloth , clothreal where cloth.realClothid = clothreal.id and cloth.size = clothreal.size and cloth.color = clothreal.color and cloth.id = ?;";
	
	
	@SuppressWarnings("unchecked")
	public ArrayList<VirtualCloth> getVirtualClothById(int i){
		return DBManager.instance().executeQuery_ObjectList(SELECT_CLOTH_BY_ID,new Object[]{i}, VirtualCloth.build);
	}
}
