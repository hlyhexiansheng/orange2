package com.orange.virtualentity;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.orange.db.ResultObjectBuilder;

public class VirtualCloth {
	
	public static ResultObjectBuilder<VirtualCloth> build = new ResultObjectBuilder<VirtualCloth>() {
		public Object build(ResultSet resultset) throws SQLException {
			VirtualCloth cloth = new VirtualCloth();
			cloth.id = resultset.getInt(1);
			cloth.designInfoId = resultset.getInt(2);
			cloth.size = resultset.getInt(4);
			cloth.color = resultset.getInt(5);
			cloth.priture = resultset.getString(6);
			cloth.quantity = resultset.getInt(11);
			cloth.price = resultset.getInt(12);
			return cloth;
		}
	};
	
	private int id;
	
	private int designInfoId;
	
	private int size;
	
	private int color;
	
	private String priture;
	
	private int quantity;
	
	private float price;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDesignInfoId() {
		return designInfoId;
	}

	public void setDesignInfoId(int designInfoId) {
		this.designInfoId = designInfoId;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public int getColor() {
		return color;
	}

	public void setColor(int color) {
		this.color = color;
	}

	public String getPriture() {
		return priture;
	}

	public void setPriture(String priture) {
		this.priture = priture;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}
}
