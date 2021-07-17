package com.jhm.plather.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor

public class BoardVO {
		private Long b_code; // PK
		private String b_title;
		private String b_content;
		private Date b_date; 
		private Date b_moddate;
		private String b_id;
		private int b_hit;// auto
		private int b_like;
	}

